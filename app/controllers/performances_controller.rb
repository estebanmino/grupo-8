class PerformancesController < ApplicationController

  include Secured
  before_action :set_performance, only: [:show, :edit, :update, :destroy]
  before_action :set_performance_index, only: [:create]
  before_action :is_admin_logged_in?, only: %i[index show new edit create update destroy]

  # GET /performances
  # GET /performances.json
  def index
    @performances = Performance.all
  end

  # GET /performances/1
  # GET /performances/1.json
  def show
  end

  # GET /performances/new
  def new
    @performance = Performance.new
  end

  # GET /performances/1/edit
  def edit
  end

  # POST /performances
  # POST /performances.json
  def create
    @performance = Performance.new(performance_params)

    local_goals = 0
    visitor_goals = 0
    @performance.match.performances.each do |perf|
      if ( perf.user.team.id  ==  @performance.match.home_team.id )
        local_goals +=  perf.goals
      else
        visitor_goals+= perf.goals;
      end
    end
    if ( @performance.user.team.id  ==  @performance.match.home_team.id )
      local_goals +=  @performance.goals
    else
      visitor_goals+= @performance.goals;
    end
    @save = !(local_goals > @performance.match.local_goals || visitor_goals > @performance.match.visitor_goals)

    respond_to do |format|
      if @performance.match.played && @save && @performance.save
        @performance.user.update_attribute(:goals, @performance.user.goals + @performance.goals)
        format.html { redirect_to :back, notice: 'Performance was successfully created.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render :new }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /performances/1
  # PATCH/PUT /performances/1.json
  def update
    last_goals = @performance.goals

    local_goals = 0
    visitor_goals = 0
    @performance.match.performances.each do |perf|
      if ( perf.user.team.id  ==  @performance.match.home_team.id )
        local_goals +=  perf.goals
      else
        visitor_goals+= perf.goals;
      end
    end
    if ( @performance.user.team.id  ==  @performance.match.home_team.id )
      local_goals +=  params[:performance][:goals].to_i -  last_goals
    else
      visitor_goals += params[:performance][:goals].to_i - last_goals
    end


    @save = !(local_goals > @performance.match.local_goals || visitor_goals > @performance.match.visitor_goals)

    respond_to do |format|
      if @performance.match.played && @save && @performance.update(performance_params)
        @performance.user.update_attribute(:goals, @performance.user.goals + @performance.goals - last_goals)
        format.html { redirect_to :back, notice: 'Performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /performances/1
  # DELETE /performances/1.json
  def destroy
    @performanceindex = params[:performanceindex]
    @performance.user.update_attribute(:goals, @performance.user.goals - @performance.goals)
    @performance.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Performance was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance
      @performance = Performance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performance_params
      params.require(:performance).permit(:user_id, :match_id, :goals, :yellow_cards,
                                    :red_cards)
    end

    def set_performance_index
      @performanceindex = params[:performance][:performanceindex]
    end
end
