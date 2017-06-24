module Api::V1
  class TeamsController < ApiController
    before_action :authenticate

    def index
      @teams = Team.all

    end

    def create
       @team = @current_user.teams.build(team_params)
       return if @team.save
       render json: { errors: @team.errors }, status: :unprocessable_entity
    end

    def show
       @team = Team.find(params[:id])
    end

    private

    def team_params

      def team_params
        params.require(:team).permit(:name, :points, :won, :lost, :tie, :logo, :division_id)
      end
    end



  end
end
