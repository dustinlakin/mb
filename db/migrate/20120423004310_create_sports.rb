class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.references :author_id
      t.string :name

      t.timestamps
    end
  end
end
