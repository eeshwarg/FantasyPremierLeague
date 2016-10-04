class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :homeGround
      t.string :manager

      t.timestamps
    end
  end
end
