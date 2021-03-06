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

ActiveRecord::Schema.define(version: 20180218204113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"

  create_table "job_requests", force: :cascade do |t|
    t.integer "client_id"
    t.string "address"
    t.string "possible_times"
    t.text "description"
    t.string "guest_first_name"
    t.string "guest_last_name"
    t.string "guest_phone_number"
    t.string "guest_email"
    t.string "guest_preferred_contact"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "employee_id"
    t.datetime "confirmed_time"
    t.datetime "time_work_started"
    t.datetime "time_work_completed"
    t.boolean "bill_sent", default: false
    t.boolean "is_paid", default: false
    t.text "admin_notes"
    t.text "employee_notes"
    t.string "address"
    t.text "description"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }
    t.money "bill_amount", scale: 2
    t.string "customer_first_name"
    t.string "customer_last_name"
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
