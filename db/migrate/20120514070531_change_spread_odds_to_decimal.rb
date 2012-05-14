class ChangeSpreadOddsToDecimal < ActiveRecord::Migration
  def up
  	change_column :spreads, :odds, :decimal
  end

  def down
  	change_column :spreads, :odds, :integer
  end
end
