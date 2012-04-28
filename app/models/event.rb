class Event < ActiveRecord::Base
	belongs_to :sport
	has_many :schedules
	has_many :teams, :through => :schedules
end
