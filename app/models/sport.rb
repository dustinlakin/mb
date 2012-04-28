class Sport < ActiveRecord::Base
	belongs_to :sportsCategory, :inverse_of => :sports,  :foreign_key => "sportsCategory_id"
	has_many :events
	has_many :teams
end