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

ActiveRecord::Schema[7.0].define(version: 2023_04_04_223859) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.datetime "deleted_at"
    t.index ["company_id"], name: "index_addresses_on_company_id"
    t.index ["deleted_at"], name: "index_addresses_on_deleted_at"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.date "card_expire"
    t.string "card_number"
    t.string "card_type"
    t.string "currency"
    t.string "iban"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_banks_on_deleted_at"
    t.index ["user_id"], name: "index_banks_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "department"
    t.string "name"
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_companies_on_deleted_at"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "coordinates", force: :cascade do |t|
    t.string "lat"
    t.string "lng"
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["address_id"], name: "index_coordinates_on_address_id"
    t.index ["deleted_at"], name: "index_coordinates_on_deleted_at"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "hairs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "color"
    t.string "hair_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_hairs_on_deleted_at"
    t.index ["user_id"], name: "index_hairs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "maiden_name"
    t.integer "age"
    t.string "gender"
    t.string "email"
    t.string "phone"
    t.string "username"
    t.string "password"
    t.string "image"
    t.string "blood_group"
    t.string "height"
    t.string "weight"
    t.string "eye_color"
    t.string "domain"
    t.string "ip"
    t.string "mac_address"
    t.string "university"
    t.string "ein"
    t.string "ssn"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birth_date"
    t.boolean "edited", default: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

  add_foreign_key "banks", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "coordinates", "addresses"
  add_foreign_key "hairs", "users"
end
