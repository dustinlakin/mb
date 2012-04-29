class Schedule < ActiveRecord::Base
  belongs_to :team
  belongs_to :event

  def set_home(is_home = false)
  	self.home = is_home
  	self.save
  end
end