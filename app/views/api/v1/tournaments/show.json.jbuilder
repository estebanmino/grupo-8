# frozen_string_literal: true

 json.tournament do
   json.href api_v1_tournament_url(@tournament)
   json.name @tournament.name
   json.id @tournament.id
   json.description @tournament.description
   json.season @tournament.season
   json.playoff @tournament.playoff
   json.division_id @tournament.division_id
   json.division Division.find(@tournament.division_id).name

   json.teams do
     json.array! @tournament.teams do |team|
       json.href api_v1_team_url(team)
       json.name team.name
       json.points team.points
     end
   end
 end
