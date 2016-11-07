class Ownership < ActiveRecord::Base
  belongs_to :player
  belongs_to :user
  validates :player_id, :uniqueness => { :scope => :user_id }

end
