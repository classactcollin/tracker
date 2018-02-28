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

ActiveRecord::Schema.define(version: 20180226002006) do

  create_table "invisalign_trackers", force: :cascade do |t|
    t.datetime "in"
    t.datetime "out"
    t.integer  "duration"
    t.integer  "daynumber"
    t.integer  "tracker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invisalign_trackers", ["tracker_id"], name: "index_invisalign_trackers_on_tracker_id"

  create_table "trackers", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "start_date"
  end

  add_index "trackers", ["user_id"], name: "index_trackers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
