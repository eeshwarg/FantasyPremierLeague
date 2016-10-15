json.array!(@games) do |game|
  json.extract! game, :id, :date, :aTeam_id, :bTeam_id, :aScore, :bScore
  json.url game_url(game, format: :json)
end
