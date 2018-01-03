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

ActiveRecord::Schema.define(version: 20180103022156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "interviews", force: :cascade do |t|
    t.integer "job_request_id"
    t.string "time"
    t.string "address"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_requests", force: :cascade do |t|
    t.integer "client_id"
    t.string "address"
    t.string "possible_times"
    t.string "work_description"
    t.decimal "quantity_hours"
    t.boolean "interview_requested"
    t.string "possible_interview_times"
    t.string "interview_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "job_request_id"
    t.datetime "confirmed_time"
    t.datetime "time_work_started"
    t.datetime "time_work_completed"
    t.boolean "is_paid"
    t.string "admin_notes"
    t.string "employee_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.string "address"
    t.string "availability"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
