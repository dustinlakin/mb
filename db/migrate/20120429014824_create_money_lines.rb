class CreateMoneyLines < ActiveRecord::Migration
  def change
    create_table :money_lines do |t|
      t.references :event
      t.references :team
      t.integer :odds

      t.timestamps
    end
    add_index :money_lines, :event_id
    add_index :money_lines, :team_id
  end
end
