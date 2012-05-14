class FixesToOverUnder < ActiveRecord::Migration
  def up
  	add_column :over_unders, :points, :integer
  	add_column :over_unders, :over, :boolean
  end

  def down
  	remove_column :over_unders, :points
  	remove_column :over_unders, :over
  end
end
