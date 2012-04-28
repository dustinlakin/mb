class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :fb
      t.string :name
      t.string :user
      t.string :password
      t.integer :currency

      t.timestamps
    end
  end
end
