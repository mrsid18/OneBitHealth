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

ActiveRecord::Schema.define(version: 2020_12_13_042542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "professional_name", null: false
    t.date "appointment_date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "establishment_name", null: false
    t.date "exam_date", null: false
    t.bigint "appointment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "documents"
    t.index ["appointment_id"], name: "index_exams_on_appointment_id"
  end

  create_table "shared_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "i_share_with_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["i_share_with_id"], name: "index_shared_users_on_i_share_with_id"
    t.index ["user_id", "i_share_with_id"], name: "index_shared_users_on_user_id_and_i_share_with_id", unique: true
    t.index ["user_id"], name: "index_shared_users_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "establishment_name", null: false
    t.integer "kind", null: false
    t.date "treatment_date", null: false
    t.bigint "appointment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_treatments_on_appointment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "users"
  add_foreign_key "exams", "appointments"
  add_foreign_key "treatments", "appointments"
end
