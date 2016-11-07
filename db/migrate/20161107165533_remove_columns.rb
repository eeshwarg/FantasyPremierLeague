class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :players, :points, :integer
  end
end
