module Api::V1
  class TournamentsController < ApiController
    before_action :authenticate, only: [:create, :destroy]
    before_action :set_tournament, only: [:show, :destroy]

    def index
      @tournaments = Tournament.all

    end

    def create
       division = Division.find(params[:division_id])

       @tournament = division.tournaments.build(tournament_params)

       return if @tournament.save
       render json: { errors: @tournament.errors }, status: :unprocessable_entity
    end

    def show

    end

    def destroy

      if @current_user.is_admin
        @tournament.destroy
      end
        return
      render json: { errors: @tournament.errors }, status: :unprocessable_entity

    end

    private

    def set_tournament
      @tournament = Tournament.find(params[:id])


    end

    def tournament_params
      params.require(:tournament).permit(:name, :description, :season)
    end




  end
end
