class ChangeMoneyLineToScheduleSystem < ActiveRecord::Migration
  def up
  	remove_column :money_lines, :team_id
  	remove_column :money_lines, :event_id
  	add_column :money_lines, :schedule_id, :integer
  end

  def down
  	add_column :money_lines, :team_id, :integer	
  	add_column :money_lines, :event_id, :integer
  	remove_column :money_lines, :schedule_id
  end
end
