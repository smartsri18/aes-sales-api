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

ActiveRecord::Schema.define(version: 2020_05_28_191416) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobile_number"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "entity_name"
    t.integer "entity_type"
    t.date "purchased_date"
    t.decimal "taxable_amount", precision: 10, scale: 2
    t.integer "gst_amount"
    t.decimal "invoice_amount", precision: 10, scale: 2
    t.integer "paid_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "invoice_id"
    t.string "name"
    t.string "code"
    t.decimal "rate", precision: 10, scale: 2
    t.integer "quantity"
    t.decimal "total_price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_products_on_invoice_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobile_number"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "products", "invoices"
end
