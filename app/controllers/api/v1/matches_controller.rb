module Api::V1
  class MatchesController < ApiController
    before_action :authenticate


    def index
      @matches = Match.all

    end


    def show
       @match = Match.find(params[:id])
    end

    private

    def match_params

      params.require(:match).permit(:date, :time, :home_team_id, :visit_team_id, :tournament_id,
                                    :visitor_goals, :local_goals, :played, :Datenum, :playoff)
    end



  end
end
