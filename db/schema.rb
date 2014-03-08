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

ActiveRecord::Schema.define(version: 20140308035549) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "location"
    t.datetime "start"
    t.datetime "end"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["team_id"], name: "index_events_on_team_id"

  create_table "fans", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "nickname"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "location"
    t.string   "hometown"
    t.string   "gender"
    t.string   "urls"
    t.string   "verified"
    t.string   "timezone"
    t.string   "locale"
    t.string   "expires"
    t.datetime "expires_at"
  end

  add_index "fans", ["email"], name: "index_fans_on_email", unique: true
  add_index "fans", ["reset_password_token"], name: "index_fans_on_reset_password_token", unique: true

  create_table "loves", force: true do |t|
    t.integer  "fan_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loves", ["fan_id"], name: "index_loves_on_fan_id"
  add_index "loves", ["team_id"], name: "index_loves_on_team_id"

  create_table "teams", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "fan_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id"
  add_index "tickets", ["fan_id"], name: "index_tickets_on_fan_id"

end
