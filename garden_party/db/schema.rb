# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_25_190240) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flowers", force: :cascade do |t|
    t.string "flower_type", null: false
    t.bigint "gardener_id"
    t.bigint "garden_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_flowers_on_garden_id"
    t.index ["gardener_id"], name: "index_flowers_on_gardener_id"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "name", null: false
    t.integer "size", null: false
    t.bigint "garden_owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_owner_id", "name"], name: "garden_owner_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "flowers", "gardens"
  add_foreign_key "flowers", "users", column: "gardener_id"
  add_foreign_key "gardens", "users", column: "garden_owner_id"
end
