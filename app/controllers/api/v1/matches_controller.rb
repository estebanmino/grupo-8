module Api::V1
  class MatchesController < ApiController
    before_action :authenticate, only: [:create, :destroy]
    before_action :set_match, only: [:show, :destroy]


    def index
      @matches = Match.all

    end


    def show

    end

    def create
      if @current_user.is_admin
       @tournament = Tournament.find(params[:tournament_id])
       @match = @tournament.matches.build(match_params)
       return if @match.save
      end
       render json: { errors: @match.errors }, status: :unprocessable_entity
    end

    def destroy
      if @current_user.is_admin
        @match.destroy
      end
        return
      render json: { errors: @match.errors }, status: :unprocessable_entity


    end

    private

    def match_params

      params.require(:match).permit(:date, :time, :home_team_id, :visit_team_id, :tournament_id,
                                    :visitor_goals, :local_goals, :played, :Datenum, :playoff)
    end

    def set_match
      @match = Match.find(params[:id])
    end



  end
end
