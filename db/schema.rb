# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120514070531) do

  create_table "bets", :force => true do |t|
    t.integer  "membership_id"
    t.integer  "amount"
    t.decimal  "odds",          :precision => 10, :scale => 0
    t.integer  "moneyLine_id"
    t.integer  "overUnder_id"
    t.integer  "spread_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "bets", ["membership_id"], :name => "index_bets_on_membership_id"
  add_index "bets", ["moneyLine_id"], :name => "index_bets_on_moneyLine_id"
  add_index "bets", ["overUnder_id"], :name => "index_bets_on_overUnder_id"
  add_index "bets", ["spread_id"], :name => "index_bets_on_spread_id"

  create_table "category_rules", :force => true do |t|
    t.integer  "group_id"
    t.integer  "sportsCategory_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "category_rules", ["group_id"], :name => "index_category_rules_on_group_id"
  add_index "category_rules", ["sportsCategory_id"], :name => "index_category_rules_on_sportsCategory_id"

  create_table "events", :force => true do |t|
    t.integer  "sport_id"
    t.string   "name"
    t.text     "description"
    t.datetime "event_date"
    t.datetime "bet_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "min_bet"
    t.integer  "max_bet"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "starting_funds"
    t.integer  "join_price"
    t.string   "password"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.decimal  "funds",      :precision => 10, :scale => 0
    t.boolean  "is_admin"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "money_lines", :force => true do |t|
    t.integer  "event_id"
    t.integer  "team_id"
    t.integer  "odds"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "money_lines", ["event_id"], :name => "index_money_lines_on_event_id"
  add_index "money_lines", ["team_id"], :name => "index_money_lines_on_team_id"

  create_table "over_unders", :force => true do |t|
    t.integer  "event_id"
    t.integer  "odds"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "points"
    t.boolean  "over"
  end

  add_index "over_unders", ["event_id"], :name => "index_over_unders_on_event_id"

  create_table "schedules", :force => true do |t|
    t.integer  "team_id"
    t.integer  "event_id"
    t.boolean  "home"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedules", ["event_id"], :name => "index_schedules_on_event_id"
  add_index "schedules", ["team_id"], :name => "index_schedules_on_team_id"

  create_table "sport_rules", :force => true do |t|
    t.integer  "sport_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "category_rule_id"
  end

  add_index "sport_rules", ["category_rule_id"], :name => "index_sport_rules_on_categoryRule_id"
  add_index "sport_rules", ["sport_id"], :name => "index_sport_rules_on_sport_id"

  create_table "sports", :force => true do |t|
    t.integer  "sportsCategory_id"
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sports_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spreads", :force => true do |t|
    t.integer  "event_id"
    t.integer  "team_id"
    t.decimal  "odds",       :precision => 10, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "spreads", ["event_id"], :name => "index_spreads_on_event_id"
  add_index "spreads", ["team_id"], :name => "index_spreads_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.integer  "sport_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teams", ["sport_id"], :name => "index_teams_on_sport_id"

  create_table "users", :force => true do |t|
    t.integer  "fb"
    t.string   "name"
    t.string   "user"
    t.string   "password"
    t.integer  "currency"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
  end

end
