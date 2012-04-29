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

ActiveRecord::Schema.define(:version => 20120429014931) do

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
    t.integer  "odds"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
