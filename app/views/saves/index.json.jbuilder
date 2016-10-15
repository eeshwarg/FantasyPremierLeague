json.array!(@saves) do |safe|
  json.extract! safe, :id, :game_id, :sTime, :player_id
  json.url safe_url(safe, format: :json)
end
