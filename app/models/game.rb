class Game < ActiveRecord::Base
  belongs_to :aTeam, :class_name => 'Team'
  belongs_to :bTeam, :class_name => 'Team'
  has_many :participations
  has_many :teams, :through => :participations
end
