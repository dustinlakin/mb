class CreateOverUnders < ActiveRecord::Migration
  def change
    create_table :over_unders do |t|
      t.references :event
      t.integer :odds

      t.timestamps
    end
    add_index :over_unders, :event_id
  end
end
