class Sport < ActiveRecord::Base
	belongs_to :sportsCategory
	has_many :events
	has_many :teams
end