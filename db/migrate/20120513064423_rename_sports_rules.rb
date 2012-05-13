class RenameSportsRules < ActiveRecord::Migration
  def up
  	rename_column :sport_rules, :categoryRule_id, :category_rule_id
  end

  def down
  	rename_column :sport_rules, :category_rule_id, :categoryRule_id 
  end
end
