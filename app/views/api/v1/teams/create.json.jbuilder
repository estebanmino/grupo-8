# frozen_string_literal: true

 json.match do
   json.href api_v1_team_url(@team)
   json.name @team.name
   json.division_id @team.division_id
   json.division Division.find(@team.division_id).name



 end
