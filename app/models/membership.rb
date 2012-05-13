class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	has_many :bets

	#upon beeing added, membership will set starting funds
	def set_starting_funds(admin = false)
		self.funds = group.starting_funds
		self.is_admin = admin
		self.save
	end
end