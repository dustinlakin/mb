class EventController < ApplicationController
	def find
		#Rails.logger.info("PARAMS: #{params.inspect}")
		#@t = Team.where(:name => params["team"])
		#@e = Event.joins(:teams).where("teams.name" => params["team"])
		@events = Event.filtered(params)
		@allTeams = Team.where(:sport_id => 1)
	end
end