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

ActiveRecord::Schema.define(version: 2021_09_14_222639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crews", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ship_id"
    t.bigint "squad_id"
    t.index ["ship_id"], name: "index_crews_on_ship_id"
    t.index ["squad_id"], name: "index_crews_on_squad_id"
  end

  create_table "crews_droids", force: :cascade do |t|
    t.integer "crew_id"
    t.integer "droid_id"
  end

  create_table "crews_passengers", force: :cascade do |t|
    t.integer "crew_id"
    t.integer "user_id"
  end

  create_table "crews_rebels", force: :cascade do |t|
    t.integer "crew_id"
    t.integer "user_id"
  end

  create_table "droids", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.text "features"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "system"
    t.string "coord"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "missions", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.text "details"
    t.integer "status"
    t.bigint "commander_id"
    t.bigint "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commander_id"], name: "index_missions_on_commander_id"
    t.index ["location_id"], name: "index_missions_on_location_id"
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.text "features"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "squads", force: :cascade do |t|
    t.string "name"
    t.bigint "leader_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "mission_id"
    t.index ["leader_id"], name: "index_squads_on_leader_id"
    t.index ["mission_id"], name: "index_squads_on_mission_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "phone"
    t.string "name"
    t.string "rank"
    t.boolean "jedi"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "crews", "ships"
  add_foreign_key "crews", "squads"
  add_foreign_key "missions", "locations"
  add_foreign_key "missions", "users", column: "commander_id"
  add_foreign_key "squads", "missions"
  add_foreign_key "squads", "users", column: "leader_id"
end
