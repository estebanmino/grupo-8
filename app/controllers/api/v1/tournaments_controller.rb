module Api::V1
  class TournamentsController < ApiController
    before_action :authenticate

    def index
      @tournaments = Tournament.all

    end

    def create
       @tournament = @current_user.tournaments.build(tournament_params)
       return if @tournament.save
       render json: { errors: @tournament.errors }, status: :unprocessable_entity
    end

    def show
       @tournament = Tournament.find(params[:id])
    end

    private

    def tournament_params

      def tournament_params
        params.require(:tournament).permit(:name, :description, :season)
      end

    end



  end
end
