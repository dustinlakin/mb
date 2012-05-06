class EventController < ApplicationController
	def find
		#Rails.logger.info("PARAMS: #{params.inspect}")
		@events = Event.filtered(params)
		@allSportsCat = SportsCategory.all
		@allSports = Sport.all
		@allTeams = Team.where(:sport_id => 1)
	end

	def results
		@events = Event.filtered(params)
		#respond_to do |format|
			#format.js { render :layout => false }
		#end
		render :layout => false
	end
end