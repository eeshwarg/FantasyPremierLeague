class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.references :game, index: true
      t.integer :sTime
      t.references :player, index: true

      t.timestamps
    end
  end
end
