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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_09_14_083429) do
=======
ActiveRecord::Schema.define(version: 2021_09_14_072452) do
>>>>>>> 4cd3cb0 (created restaurant model with name validation)

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.string "photo_url"
=======
  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.float "lat"
    t.float "long"
    t.datetime "opening_time"
    t.datetime "closing_time"
>>>>>>> 4cd3cb0 (created restaurant model with name validation)
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
