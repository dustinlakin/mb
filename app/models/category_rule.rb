class CategoryRule < ActiveRecord::Base
  belongs_to :group
  belongs_to :sportsCategory
  has_many :sportRules, :foreign_key => "category_rule_id"
end
