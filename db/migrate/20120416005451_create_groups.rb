class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :min_bet
      t.integer :max_bet
      t.datetime :start_date
      t.datetime :end_date
      t.integer :starting_funds
      t.integer :join_price
      t.string :password

      t.timestamps
    end
  end
end
