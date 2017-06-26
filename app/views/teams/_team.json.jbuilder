json.extract! team, :id, :name, :points, :won, :lost, :tie, :created_at, :updated_at
json.url team_url(team, format: :json)
