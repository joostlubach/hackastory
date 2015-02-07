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

ActiveRecord::Schema.define(version: 20150206134520) do

  create_table "aspects", force: :cascade do |t|
    t.integer  "story_id"
    t.string   "aspect"
    t.string   "type"
    t.integer  "order"
    t.string   "badge",          limit: 10
    t.text     "text_content"
    t.binary   "binary_content"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "aspects", ["story_id"], name: "index_aspects_on_story_id"

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image_url"
    t.string   "source_url"
    t.date     "happened_on"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "unlocks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "aspect_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "unlocks", ["aspect_id"], name: "index_unlocks_on_aspect_id"
  add_index "unlocks", ["user_id"], name: "index_unlocks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
