class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :game, index: true
      t.integer :gTime
      t.references :player, index: true

      t.timestamps
    end
  end
end
