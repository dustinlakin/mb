class Event < ActiveRecord::Base
	belongs_to :sport
	has_many :schedules
	has_many :teams, :through => :schedules
	has_many :overUnders
	has_many :moneyLines
	has_many :spreads
end
