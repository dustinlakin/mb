class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.references :sport

      t.timestamps
    end
    add_index :teams, :sport_id
  end
end
