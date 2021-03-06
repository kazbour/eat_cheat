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

ActiveRecord::Schema.define(version: 20150513160748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.datetime "time_eaten"
    t.decimal  "quant_of_item_eaten"
    t.string   "integer"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "recipe_id"
    t.integer  "item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "nutritionix_id"
    t.integer  "calories"
    t.decimal  "fat"
    t.decimal  "protein"
    t.decimal  "carbs"
    t.integer  "serving_weight_grams"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.integer  "user_id"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "meals", force: :cascade do |t|
    t.datetime "time_eaten"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "item_id"
  end

  add_index "meals", ["item_id"], name: "index_meals_on_item_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.integer  "height"
    t.integer  "weight"
    t.string   "activity_level"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "items", "users"
  add_foreign_key "meals", "items"
end
