class EventController < ApplicationController
	def find
		#Rails.logger.info("PARAMS: #{params.inspect}")
		@events = Event.filtered(params)
		@allSportsCat = SportsCategory.all
		@allSports = Sport.includes(:teams).all
	end

	def results
		@events = Event.filtered(params)
		#respond_to do |format|
			#format.js { render :layout => false }
		#end
		render :layout => false
	end

	def test
		@result = SportsCategory.includes(:sports => :teams).all.map {|s| s.test}
		render :json => @result
	end

end