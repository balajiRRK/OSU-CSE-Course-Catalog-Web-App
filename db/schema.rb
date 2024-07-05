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

ActiveRecord::Schema[7.1].define(version: 2024_07_05_115821) do
  create_table "courses", force: :cascade do |t|
    t.integer "courseId"
    t.string "catalog_number"
    t.string "title"
    t.string "description"
    t.string "short_description"
    t.string "component"
    t.string "term"
    t.string "campus"
    t.string "subject"
    t.string "catalog_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "course_id"
    t.string "catalog_number"
    t.integer "class_number"
    t.string "component"
    t.string "instruction_mode"
    t.string "facility_id"
    t.string "facility_description"
    t.string "room"
    t.string "start_time"
    t.string "end_time"
    t.string "start_date"
    t.string "end_date"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.string "instructor"
    t.string "instructor_role"
    t.string "instructor_email"
    t.string "term"
    t.string "section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
