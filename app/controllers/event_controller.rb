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
	def eventResults
		# @events = Event.first.includes(:teams);
		@events = Event.includes(:teams,:overUnders,:moneyLines, :spreads, :schedules).all.map{|e| e.render_json}
		# @events = Event.includes(:teams,:overUnders,:schedules,:moneyLines,:spreads).first.render_json
		# @result = SportsCategory.includes(:sports => :teams).all.map {|s| s.test}
		render :json => @events, :callback => params[:callback]
	end

	def selects
		@result = SportsCategory.includes(:sports => :teams).all.map {|s| s.test}
		render :json => @result
	end

end