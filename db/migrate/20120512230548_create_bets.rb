class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.references :membership
      t.integer :amount
      t.decimal :odds
      t.references :moneyLine
      t.references :overUnder
      t.references :spread

      t.timestamps
    end
    add_index :bets, :membership_id
    add_index :bets, :moneyLine_id
    add_index :bets, :spread_id
    add_index :bets, :overUnder_id
  end
end
