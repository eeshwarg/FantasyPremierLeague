class CreateRedCards < ActiveRecord::Migration
  def change
    create_table :red_cards do |t|
      t.references :game, index: true
      t.integer :rTime
      t.references :player, index: true

      t.timestamps
    end
  end
end
