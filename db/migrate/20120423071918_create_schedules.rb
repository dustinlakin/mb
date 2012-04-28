class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :team
      t.references :event
      t.boolean :home

      t.timestamps
    end
    add_index :schedules, :team_id
    add_index :schedules, :event_id
  end
end
