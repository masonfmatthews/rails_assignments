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

ActiveRecord::Schema.define(version: 20150714153455) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.integer  "developer_id"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.date     "joined_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_assignments", force: :cascade do |t|
    t.integer  "developer_id"
    t.integer  "group_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_assignments", force: :cascade do |t|
    t.integer  "developer_id"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.date     "started_on"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_entries", force: :cascade do |t|
    t.integer  "developer_id"
    t.integer  "project_id"
    t.date     "worked_on"
    t.decimal  "duration"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
