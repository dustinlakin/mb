class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :sport
      t.string :name
      t.text :description
      t.datetime :event_date
      t.datetime :bet_by

      t.timestamps
    end
  end
end
