module Api::V1
  class UsersController < ApiController
    before_action :authenticate
    before_action :set_user, only: [:show, :destroy]

    def show

      @user = User.find(params[:id])

    end

    def index

      @users = User.all

    end

    def destroy
      if @current_user.is_admin
        @user.destroy
      end
        return
      render json: { errors: @user.errors }, status: :unprocessable_entity

    end

    private


    def set_user
      @user = User.find(params[:id])
    end
  end
end
