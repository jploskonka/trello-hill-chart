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

ActiveRecord::Schema.define(version: 2020_11_03_075723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scope_statuses", force: :cascade do |t|
    t.bigint "scope_id"
    t.integer "progress", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scope_id"], name: "index_scope_statuses_on_scope_id"
  end

  create_table "scopes", force: :cascade do |t|
    t.string "trello_card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color", null: false
    t.index ["trello_card_id"], name: "index_scopes_on_trello_card_id", unique: true
  end

  add_foreign_key "scope_statuses", "scopes"
end
