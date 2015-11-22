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

ActiveRecord::Schema.define(version: 20151122141405) do

  create_table "balance_changes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "payment_id", null: false
    t.decimal  "change",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "balance_changes", ["payment_id"], name: "index_balance_changes_on_payment_id"
  add_index "balance_changes", ["user_id"], name: "index_balance_changes_on_user_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "creator_id", null: false
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["creator_id"], name: "index_payments_on_creator_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.decimal  "balance",    default: 0.0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
