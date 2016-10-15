class CreateAssists < ActiveRecord::Migration
  def change
    create_table :assists do |t|
      t.references :game, index: true
      t.integer :aTime
      t.references :player, index: true

      t.timestamps
    end
  end
end
