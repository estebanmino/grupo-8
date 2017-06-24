# frozen_string_literal: true

 json.match do
   json.href api_v1_tournament_url(@tournament)
   json.name @tournament.name
   json.id @tournament.id
   json.description @tournament.description
   json.season @tournament.season
   json.playoff @tournament.playoff
   json.division_id @tournament.division_id
   json.division Division.find(@tournament.division_id).name




 end
