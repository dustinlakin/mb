class Event < ActiveRecord::Base
	belongs_to :sport
	has_many :schedules
	has_many :teams, :through => :schedules
	has_many :overUnders
	has_many :moneyLines
	has_many :spreads

	def self.filtered(params)
		hash = {}
		r = Event
		r = r.includes(:moneyLines).includes(:spreads).includes(:overUnders).includes(:schedules).includes(:teams)

		if params["sport_cat"] 
			r = r.joins(:sport)
			hash["sports.sportsCategory_id"] = params["sport_cat"]
		end
		if params["sport"] 
			r = r.joins(:sport)
			hash["sports.id"] = params["sport"]
		end
		if params["team"] 
			teams = params["team"]
			if teams.include? ","
				teams = teams.split(",")
			end
			hash["id"] = Schedule.where("team_id" => teams).select("event_id").map { |m| m.event_id}.uniq
		end
		Rails.logger.info("PARAMS: #{hash}")
		r.where(hash).uniq
	end
end