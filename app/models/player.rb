class Player < ActiveRecord::Base
  belongs_to :Team
  has_many :ownerships
  has_many :users, :through => :ownerships


  def full_name
    [fName, lName].join(' ')
  end
end
