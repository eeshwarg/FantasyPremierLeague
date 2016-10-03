class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fName
      t.string :lName
      t.string :username
      t.string :password
      t.string :gender
      t.date :dob
      t.integer :age
      t.decimal :budget
      t.string :email
      t.string :favClub
      t.string :salt

      t.timestamps
    end
  end
end
