module Api::V1
  class TeamsController < ApiController
    before_action :authenticate, only: [:create, :destroy]
    before_action :set_team, only: [:show, :destroy]

    def index
      @teams = Team.all

    end

    def create
       @division = Division.find(params[:division_id])
       @team = @division.teams.build(team_params)
       return if @team.save
       render json: { errors: @team.errors }, status: :unprocessable_entity
    end

    def show
       @team = Team.find(params[:id])
    end

    def destroy
      if @current_user.is_admin
        @team.destroy
      end
        return
      render json: { errors: @team.errors }, status: :unprocessable_entity


    end

    private



    def team_params
      params.require(:team).permit(:name, :points, :won, :lost, :tie, :logo, :division_id)
    end

    def set_team
      @team = Team.find(params[:id])
    end




  end
end
