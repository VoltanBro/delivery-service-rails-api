# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_10_172246) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "couriers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "driver_licence"
    t.boolean "courier_valid"
    t.index ["email"], name: "index_couriers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_couriers_on_reset_password_token", unique: true
  end

  create_table "delivery_managers", id: false, force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "enabled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_delivery_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_delivery_managers_on_reset_password_token", unique: true
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "package_assignments", force: :cascade do |t|
    t.uuid "package_id"
    t.bigint "courier_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["courier_id"], name: "index_package_assignments_on_courier_id"
    t.index ["package_id"], name: "index_package_assignments_on_package_id"
  end

  create_table "packages", id: false, force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.datetime "estimated_delivery_date"
    t.string "tracking_number", null: false
    t.integer "courier_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "delivery_status", default: 0
    t.string "token"
    t.datetime "token_exp_time"
    t.index ["courier_id"], name: "index_packages_on_courier_id"
    t.index ["delivery_status"], name: "index_packages_on_delivery_status"
    t.index ["tracking_number"], name: "index_packages_on_tracking_number"
  end

  add_foreign_key "package_assignments", "couriers"
end
