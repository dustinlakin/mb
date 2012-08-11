class Group < ActiveRecord::Base
	has_many :memberships
	has_many :members, :through => :memberships, :class_name => "User", :foreign_key => "user_id", :source => :user

	has_many :categoryRules
	has_many :sportsCategories, :through => :categoryRules
	has_many :sportRules, :through => :categoryRules
	has_many :sports, :through => :sportRules

	#has_many :sportRules
	#has_many :sports, :through => :sportRules

	def bettable_event(event)
		self.sports.include?(event.sport)
	end
end