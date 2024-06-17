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

ActiveRecord::Schema[7.0].define(version: 2024_06_14_091353) do
  create_table "games", force: :cascade do |t|
    t.integer "player1_id", null: false
    t.integer "player2_id", null: false
    t.integer "winner_id"
    t.integer "current_player", default: 0
    t.integer "field1", default: 0
    t.integer "field2", default: 0
    t.integer "field3", default: 0
    t.integer "field4", default: 0
    t.integer "field5", default: 0
    t.integer "field6", default: 0
    t.integer "field7", default: 0
    t.integer "field8", default: 0
    t.integer "field9", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player1_id"], name: "index_games_on_player1_id"
    t.index ["player2_id"], name: "index_games_on_player2_id"
    t.index ["winner_id"], name: "index_games_on_winner_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "players", column: "player1_id"
  add_foreign_key "games", "players", column: "player2_id"
  add_foreign_key "games", "players", column: "winner_id"
end
