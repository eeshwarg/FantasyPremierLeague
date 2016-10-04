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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161004094434) do

  create_table "players", force: true do |t|
    t.string   "fName"
    t.string   "lName"
    t.string   "position"
    t.boolean  "isSuspended"
    t.integer  "rating"
    t.integer  "age"
    t.integer  "value"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "cleanSheets"
    t.integer  "saves"
    t.integer  "Team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["Team_id"], name: "index_players_on_Team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "homeGround"
    t.string   "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "fName"
    t.string   "lName"
    t.string   "username"
    t.string   "password"
    t.string   "gender"
    t.date     "dob"
    t.integer  "age"
    t.decimal  "budget",     precision: 10, scale: 0
    t.string   "email"
    t.string   "favClub"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end