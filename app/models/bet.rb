class Bet < ActiveRecord::Base
  belongs_to :membership
  belongs_to :moneyLine
  belongs_to :spread
  belongs_to :overUnder
end
