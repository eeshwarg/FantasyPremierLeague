json.array!(@players) do |player|
  json.extract! player, :id, :fName, :lName, :position, :isSuspended, :rating, :age, :value, :goals, :assists, :cleanSheets, :saves, :Team_id
  json.url player_url(player, format: :json)
end
