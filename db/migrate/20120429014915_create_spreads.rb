class CreateSpreads < ActiveRecord::Migration
  def change
    create_table :spreads do |t|
      t.references :event
      t.references :team
      t.integer :odds

      t.timestamps
    end
    add_index :spreads, :event_id
    add_index :spreads, :team_id
  end
end
