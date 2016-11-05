class Player < ActiveRecord::Base
  belongs_to :Team
  has_many :ownerships
  has_many :users, :through => :ownerships
  has_many :participations
  has_many :games, :through => :participations

  def full_name
    [fName, lName].join(' ')
  end
end
