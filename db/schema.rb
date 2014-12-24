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

ActiveRecord::Schema.define(version: 20141220023550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.datetime "published"
    t.string   "url"
    t.string   "entry_id"
    t.string   "categories"
    t.integer  "rss_source_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "entry_mappings", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "entry_id"
    t.boolean "is_valid",   default: true
    t.boolean "has_stared"
  end

  add_index "entry_mappings", ["entry_id"], name: "index_entry_mappings_on_entry_id", using: :btree
  add_index "entry_mappings", ["user_id"], name: "index_entry_mappings_on_user_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "entry_id"
    t.integer  "user_id"
    t.text     "abstract"
    t.text     "comment"
    t.string   "position"
    t.integer  "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["entry_id"], name: "index_notes_on_entry_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "rss_sources", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_mappings", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "rss_source_id"
    t.boolean "is_valid",      default: true
  end

  add_index "source_mappings", ["rss_source_id"], name: "index_source_mappings_on_rss_source_id", using: :btree
  add_index "source_mappings", ["user_id"], name: "index_source_mappings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "notes", "entries"
  add_foreign_key "notes", "users"
end
