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

ActiveRecord::Schema.define(version: 2020_04_17_085834) do

  create_table "calendar_habits", force: :cascade do |t|
    t.integer "calendar_id"
    t.integer "habit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_calendar_habits_on_calendar_id"
    t.index ["habit_id"], name: "index_calendar_habits_on_habit_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.date "date"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "start_time"
    t.index ["user_id"], name: "index_calendars_on_user_id"
  end

  create_table "habit_tags", force: :cascade do |t|
    t.integer "habit_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habit_id"], name: "index_habit_tags_on_habit_id"
    t.index ["tag_id"], name: "index_habit_tags_on_tag_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "length"
    t.integer "target"
    t.integer "real"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "start_time"
    t.index ["user_id"], name: "index_habits_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "habit_id"
    t.integer "time"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habit_id"], name: "index_plans_on_habit_id"
  end

  create_table "reals", force: :cascade do |t|
    t.integer "time"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
