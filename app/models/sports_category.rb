class SportsCategory < ActiveRecord::Base
	has_many :sports, :inverse_of => :sportsCategory, :foreign_key => "sportsCategory_id"

	def test(options={})
		options = { 
			:include => {
				:sports => {
					:only => [:name, :id], 
					:include => {
						:teams => {
							:only => [:name, :id, :city]
						}
					}
				}
			}, 
			:only => [:name, :id]
			}.update(options)
		as_json(options)
	end
end
