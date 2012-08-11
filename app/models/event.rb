class Event < ActiveRecord::Base
	belongs_to :sport
	has_many :schedules
	has_many :teams, :through => :schedules
	has_many :overUnders
	has_many :moneyLines, :through => :schedules
	has_many :spreads, :through => :schedules

	def render_json(options = {})
		options = { 
			:include => {
				:schedules => {
					:only => [:home, :id], 
					:include =>{
						:team => {
							:only => [:name, :id, :city]
						},
						:spread => {
							:only => [:id, :odds]
						},
						:moneyLine => {
							:only => [:id, :odds]
						},
					}
				},
				:overUnders => {
					:only => [:id, :odds, :points, :over]
				},
				
			}, 
			:only => [:name, :id, :bet_by]
			}.update(options)
		Rails.logger.info("PARAMS: #{options}")
		as_json(options)
	end

	def self.filtered(params)
		hash = {}
		r = Event
		r = r.includes(:moneyLines).includes(:spreads).includes(:overUnders).includes(:schedules).includes(:teams)

		if params["category"] 
			r = r.joins(:sport)
			categories = params["category"]
			if categories.include? ","
				 categories = categories.split(",")
			end
			hash["sports.sportsCategory_id"] = categories 
		end
		if params["sport"] 
			r = r.joins(:sport)
			sports = params["sport"]
			if sports.include? ","
				 sports = sports.split(",")
			end
			hash["sports.id"] = sports
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