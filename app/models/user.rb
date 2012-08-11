class User < ActiveRecord::Base
	has_many :memberships
	has_many :groups, :through => :memberships, :class_name => "Group", :foreign_key => "group_id" 
	has_many :bets, :through => :memberships

	validates :name, :presence => true
	validates :user, :presence => true
	validates_uniqueness_of :user
	validates_uniqueness_of :email, :message => "already in use"
	validates_format_of :email, :presence => true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	def to_param
		"#{user}"
	end 

	def find_bettable_groups(event)
		self.groups.keep_if do |g|
			g.bettable_event(event)
		end
	end
end