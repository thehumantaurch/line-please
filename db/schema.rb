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

ActiveRecord::Schema.define(version: 20150122174151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.integer  "script_id"
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lines", force: :cascade do |t|
    t.integer  "character_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenes", force: :cascade do |t|
    t.integer  "script_id"
    t.string   "header",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scripts", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "author",          limit: 255
    t.string   "filepath",        limit: 255
    t.text     "script_contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255,             null: false
    t.string   "password_digest", limit: 255,             null: false
    t.string   "email",           limit: 255,             null: false
    t.string   "first_name",      limit: 255,             null: false
    t.string   "last_name",       limit: 255,             null: false
    t.integer  "access_level",                default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
