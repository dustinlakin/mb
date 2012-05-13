class ChangeSportsRules < ActiveRecord::Migration
  def up
  	remove_column :sport_rules, :group_id
  	add_column :sport_rules, :categoryRule_id, :integer
  	remove_index :sport_rules, :column => :group_id
  	add_index :sport_rules, :categoryRule_id
  end

  def down
  	add_column :sport_rules, :group_id, :integer
  	remove_column :sport_rules, :categoryRule_id, :integer
  	add_index :sport_rules, :group_id
  	remove_index :sport_rules, :column => :categoryRule_id
  end
end
