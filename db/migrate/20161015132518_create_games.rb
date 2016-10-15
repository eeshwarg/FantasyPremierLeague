class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.references :aTeam, index: true
      t.references :bTeam, index: true
      t.integer :aScore
      t.integer :bScore

      t.timestamps
    end
  end
end
