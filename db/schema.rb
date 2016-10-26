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

ActiveRecord::Schema.define(version: 20161026173812) do

  create_table "guesses", force: :cascade do |t|
    t.string   "p513ptid"
    t.integer  "puzzle_id"
    t.integer  "guess_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_guesses_on_puzzle_id"
  end

  create_table "high_scores", force: :cascade do |t|
    t.string   "p513ptid"
    t.string   "name"
    t.integer  "guess_time"
    t.integer  "puzzle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["puzzle_id"], name: "index_high_scores_on_puzzle_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.integer  "wally_x"
    t.integer  "wally_y"
    t.integer  "wally_dx"
    t.integer  "wally_dy"
    t.integer  "width"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

end
