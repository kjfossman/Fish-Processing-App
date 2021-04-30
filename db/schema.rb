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

ActiveRecord::Schema.define(version: 2021_04_30_160018) do

  create_table "boats", force: :cascade do |t|
    t.string "name"
    t.string "captain"
    t.string "home_port"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fish_processor_id"
  end

  create_table "fish_processors", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fish_tickets", force: :cascade do |t|
    t.integer "tender_id"
    t.integer "boat_id"
    t.integer "chum_pounds", default: 0
    t.integer "sockeye_pounds", default: 0
    t.integer "coho_pounds", default: 0
    t.integer "humpy_pounds", default: 0
    t.integer "king_pounds", default: 0
    t.datetime "date"
    t.integer "ticket_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fish_processor_id"
    t.integer "invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "boat_id"
    t.float "chum_price"
    t.float "sockeye_price"
    t.float "coho_price"
    t.float "humpy_price"
    t.float "king_price"
    t.datetime "date"
    t.boolean "paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number"
  end

  create_table "tenders", force: :cascade do |t|
    t.string "name"
    t.string "captain"
    t.string "home_port"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fish_processor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
