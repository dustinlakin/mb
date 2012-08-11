class Schedule < ActiveRecord::Base
  belongs_to :team
  belongs_to :event
  has_one :spread
  has_one :moneyLine


  def set_home(is_home = false)
  	self.home = is_home
  	self.save
  end
end