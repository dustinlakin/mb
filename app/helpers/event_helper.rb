module EventHelper
	def find_events(params)
		Event.joins(:teams).where("teams.name" => params["team"])
	end
end
