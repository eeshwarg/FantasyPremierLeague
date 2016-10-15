json.array!(@assists) do |assist|
  json.extract! assist, :id, :game_id, :aTime, :player_id
  json.url assist_url(assist, format: :json)
end
