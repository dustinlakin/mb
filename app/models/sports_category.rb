class SportsCategory < ActiveRecord::Base
	has_many :sports, :inverse_of => :sportsCategory, :foreign_key => "sportsCategory_id"
end
