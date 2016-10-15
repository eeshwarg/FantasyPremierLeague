json.array!(@red_cards) do |red_card|
  json.extract! red_card, :id, :game_id, :rTime, :player_id
  json.url red_card_url(red_card, format: :json)
end
