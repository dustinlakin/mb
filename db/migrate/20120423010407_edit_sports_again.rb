class EditSportsAgain < ActiveRecord::Migration
  def up
  	rename_column :sports, :sports_category_id, :sportsCategory_id
  end

  def down
  	rename_column :sports, :sportsCategory_id, :sports_category_id
  end
end
