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

ActiveRecord::Schema.define(version: 20160304020643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t| #not currently used
    t.integer  "loi_form_id"
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "loi_forms", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "organization"
    t.string   "address"
    t.string   "phone"
    t.string   "website"
    t.string   "executive"
    t.string   "executive_phone"
    t.string   "executive_email"
    t.string   "contact"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.integer  "employees"
    t.integer  "volunteers"
    t.integer  "board"
    t.integer  "budget"
    t.text     "affiliated"
    t.text     "mission"
    t.text     "vision"
    t.text     "concerns"
    t.integer  "actual_staff_board"
    t.integer  "current_staff_board"
    t.integer  "projected_staff_board"
    t.string   "board_challenge_1"
    t.string   "board_1_priority"
    t.string   "board_challenge_2"
    t.string   "board_2_priority"
    t.string   "board_challenge_3"
    t.string   "board_3_priority"
    t.integer  "actual_staff_operations"
    t.integer  "current_staff_operations"
    t.integer  "projected_staff_operations"
    t.string   "operations_challenge_1"
    t.string   "operations_1_priority"
    t.string   "operations_challenge_2"
    t.string   "operations_2_priority"
    t.string   "operations_challenge_3"
    t.string   "operations_3_priority"
    t.integer  "actual_staff_fund"
    t.integer  "current_staff_fund"
    t.integer  "projected_staff_fund"
    t.string   "fund_challenge_1"
    t.string   "fund_1_priority"
    t.string   "fund_challenge_2"
    t.string   "fund_2_priority"
    t.string   "fund_challenge_3"
    t.string   "fund_3_priority"
    t.integer  "actual_staff_marketing"
    t.integer  "current_staff_marketing"
    t.integer  "projected_staff_marketing"
    t.string   "marketing_challenge_1"
    t.string   "marketing_1_priority"
    t.string   "marketing_challenge_2"
    t.string   "marketing_2_priority"
    t.string   "marketing_challenge_3"
    t.string   "marketing_3_priority"
    t.integer  "actual_staff_strategic"
    t.integer  "current_staff_strategic"
    t.integer  "projected_staff_strategic"
    t.string   "strategic_challenge_1"
    t.string   "strategic_1_priority"
    t.string   "strategic_challenge_2"
    t.string   "strategic_2_priority"
    t.string   "strategic_challenge_3"
    t.string   "strategic_3_priority"
    t.integer  "actual_staff_technology"
    t.integer  "current_staff_technology"
    t.integer  "projected_staff_technology"
    t.string   "technology_challenge_1"
    t.string   "technology_1_priority"
    t.string   "technology_challenge_2"
    t.string   "technology_2_priority"
    t.string   "technology_challenge_3"
    t.string   "technology_3_priority"
    t.integer  "actual_staff_other"
    t.integer  "current_staff_other"
    t.integer  "projected_staff_other"
    t.string   "other_challenge_1"
    t.string   "other_1_priority"
    t.string   "other_challenge_2"
    t.string   "other_2_priority"
    t.string   "other_challenge_3"
    t.string   "other_3_priority"
    t.text     "additional"
    t.text     "referral"
    t.string   "sectors",                                 array: true
    t.string   "other_sectors"
    t.string   "geo_focus"
    t.string   "other_geo_focus"
    t.integer  "actual_staff_total"
    t.integer  "current_staff_total"
    t.integer  "projected_staff_total"
  end

  create_table "loi_ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "loi_form_id"
    t.integer  "q1_rating"
    t.integer  "q2_rating"
    t.integer  "q3_rating"
    t.integer  "q4_rating"
    t.string   "q5_rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: true
    t.boolean  "super_admin",            default: false
    t.boolean  "confirmed",              default: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
