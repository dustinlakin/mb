class CreateSportsCategories < ActiveRecord::Migration
  def change
    create_table :sports_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
