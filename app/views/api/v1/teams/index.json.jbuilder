# frozen_string_literal: true

 json.teams do
    json.array! @teams do |team|
      json.href api_v1_team_url(team)
      json.name team.name
      json.points team.points
      json.won team.won
      json.lost team.lost
      json.tie team.tie
      json.gf team.gf
      json.ga team.ga
      json.division_id team.division_id
      json.division Division.find(team.division_id).name


    end
 end
