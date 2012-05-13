class CreateCategoryRules < ActiveRecord::Migration
  def change
    create_table :category_rules do |t|
      t.references :group
      t.references :sportsCategory

      t.timestamps
    end
    add_index :category_rules, :group_id
    add_index :category_rules, :sportsCategory_id
  end
end
