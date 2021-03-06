class UsersController < ApplicationController
  include Secured

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_admin_logged_in?, only: %i[index]
  before_action :is_current_user?, only: %i[edit update destroy]
  before_action :was_invited?, only: %i[new create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @token = params[:invitation_token]
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    token = params[:invitation_token]
    invitation = Invitation.find_by_token(token)
    @user.is_captain = invitation.is_captain
    @user.team_id = invitation.team_id
    @user.goals = 0
    @user.yellow_cards = 0
    @user.red_cards = 0
    respond_to do |format|
      if @user.save
        @user.generate_token_and_save
        log_in @user
        invitation.destroy
        format.html { redirect_to home_path, notice: 'Te damos la bienvenida a LaLiga.' }
          # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :position,
                                    :password, :password_confirmation, :goals, :yellow_cards, :red_cards)
    end

    def is_current_user?
      redirect_to(root_path, notice: 'No autorizado!') unless @user == current_user
    end
end
