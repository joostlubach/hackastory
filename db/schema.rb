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
    t.integer  "story_id",       limit: 4
    t.string   "aspect",         limit: 255
    t.string   "type",           limit: 255
    t.integer  "order",          limit: 4
    t.string   "badge",          limit: 10
    t.text     "text_content",   limit: 65535
    t.binary   "binary_content", limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "aspects", ["story_id"], name: "index_aspects_on_story_id", using: :btree

  create_table "stories", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "content",        limit: 65535
    t.string   "image_url",      limit: 255
    t.string   "source_url",     limit: 255
    t.date     "happened_on"
    t.boolean  "popular_on_nos", limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "unlocks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "aspect_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "unlocks", ["aspect_id"], name: "index_unlocks_on_aspect_id", using: :btree
  add_index "unlocks", ["user_id"], name: "index_unlocks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "aspects", "stories"
  add_foreign_key "unlocks", "aspects"
  add_foreign_key "unlocks", "users"
end
