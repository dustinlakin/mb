class CreateSportRules < ActiveRecord::Migration
  def change
    create_table :sport_rules do |t|
      t.references :group
      t.references :sport

      t.timestamps
    end
    add_index :sport_rules, :group_id
    add_index :sport_rules, :sport_id
  end
end
