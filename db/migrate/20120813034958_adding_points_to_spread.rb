class AddingPointsToSpread < ActiveRecord::Migration
  def up
  	add_column :spreads, :points, :integer
  end

  def down
  	remove_column :spreads, :points
  end
end
