# frozen_string_literal: true

 json.match do
   json.href api_v1_match_url(@match)
   json.content @match.content
   json.time @match.time
   json.date @match.date
   json.played @match.played
   json.visit_team_id @match.visit_team_id
   json.visitor Team.find(@match.visit_team_id).name
   json.visitor_goals @match.visitor_goals
   json.home_team_id @match.home_team_id
   json.home Team.find(@match.home_team_id).name
   json.home_goals @match.local_goals


 end
