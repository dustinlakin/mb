class SportRule < ActiveRecord::Base
  belongs_to :categoryRule, :foreign_key => "category_rule_id"
  belongs_to :sport
end
