class Group < ActiveRecord::Base
	has_many :memberships
	has_many :members, :through => :memberships, :class_name => "User", :foreign_key => "user_id", :source => :user
end