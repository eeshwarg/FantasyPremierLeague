json.array!(@goals) do |goal|
  json.extract! goal, :id, :game_id, :gTime, :player_id
  json.url goal_url(goal, format: :json)
end
