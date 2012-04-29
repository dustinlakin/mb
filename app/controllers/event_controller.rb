class EventController < ApplicationController
	def find
		Rails.logger.info("PARAMS: #{params.inspect}")
		#@t = Team.where(:name => params["team"])
		@e = Event.joins(:teams).where("teams.name" => params["team"])
		respond_to do |format|
    		format.html  
    		format.json  { render :json => @e}
  		end
	end
end
