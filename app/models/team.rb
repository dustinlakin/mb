class Team < ActiveRecord::Base
  belongs_to :sport
  has_many :schedules
  has_many :events, :through => :schedules
end