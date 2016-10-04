class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :fName
      t.string :lName
      t.string :position
      t.boolean :isSuspended
      t.integer :rating
      t.integer :age
      t.integer :value
      t.integer :goals
      t.integer :assists
      t.integer :cleanSheets
      t.integer :saves
      t.references :Team, index: true

      t.timestamps
    end
  end
end
