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

ActiveRecord::Schema.define(version: 2020_03_14_195216) do

  create_table "bonus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bonus_on_user_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.string "suffix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cashouts", force: :cascade do |t|
    t.integer "user_id"
    t.string "amount"
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cashouts_on_user_id"
  end

  create_table "chores", force: :cascade do |t|
    t.integer "spiffy_task_id"
    t.string "evidence"
    t.integer "status_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spiffy_task_id"], name: "index_chores_on_spiffy_task_id"
    t.index ["status_id"], name: "index_chores_on_status_id"
    t.index ["user_id"], name: "index_chores_on_user_id"
  end

  create_table "spiffy_tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "value"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "redemptions", default: 1
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
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
    t.string "avatar"
    t.string "fname"
    t.string "lname"
    t.boolean "admin", default: false
    t.string "telephone"
    t.boolean "sms_ok", default: false
    t.integer "carrier_id"
    t.integer "bank", default: 0
    t.index ["carrier_id"], name: "index_users_on_carrier_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
