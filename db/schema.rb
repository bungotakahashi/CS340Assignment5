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

ActiveRecord::Schema.define(version: 20151209050906) do

  create_table "apartment_data", force: :cascade do |t|
    t.string   "address",    limit: 255,   null: false
    t.date     "date_built"
    t.text     "comments",   limit: 65535
    t.float    "cost",       limit: 24
    t.integer  "owner_id",   limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name",       limit: 255
  end

  create_table "lives", force: :cascade do |t|
    t.string   "ssn",         limit: 255,      null: false
    t.text     "maintenance", limit: 65535
    t.binary   "contract",    limit: 16777215
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "room_id",     limit: 4
  end

  add_index "lives", ["id", "ssn"], name: "composite_index", unique: true, using: :btree

  create_table "other_properties", force: :cascade do |t|
    t.string   "address",    limit: 255,   null: false
    t.date     "date_built"
    t.text     "comments",   limit: 65535
    t.float    "cost",       limit: 24
    t.integer  "owner_id",   limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "parking_lots", force: :cascade do |t|
    t.string   "ssn",          limit: 255
    t.integer  "apartment_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "residents", primary_key: "ssn", force: :cascade do |t|
    t.binary   "document",     limit: 16777215
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "image_type",   limit: 255
    t.integer  "apartment_id", limit: 4
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "apartment_id", limit: 4,        null: false
    t.float    "rent",         limit: 24,       null: false
    t.binary   "layout",       limit: 16777215
    t.string   "request",      limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "image_type",   limit: 255
    t.string   "state",        limit: 255
    t.integer  "room_id",      limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
