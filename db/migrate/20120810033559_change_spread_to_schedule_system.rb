class ChangeSpreadToScheduleSystem < ActiveRecord::Migration
  def up
  	remove_column :spreads, :team_id
  	remove_column :spreads, :event_id
  	add_column :spreads, :schedule_id, :integer
  end

  def down
  	add_column :spreads, :team_id, :integer	
  	add_column :spreads, :event_id, :integer
  	remove_column :spreads, :schedule_id
  end
end
