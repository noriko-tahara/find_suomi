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

ActiveRecord::Schema[7.0].define(version: 2023_11_26_024150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "facility_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_bookmarks_on_facility_id"
    t.index ["user_id", "facility_id"], name: "index_bookmarks_on_user_id_and_facility_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "opening_hour"
    t.string "closed_on"
    t.string "website"
    t.string "address", null: false
    t.float "latitude"
    t.float "longitude"
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_facilities_on_prefecture_id"
  end

  create_table "facility_genres", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "facility_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id", "genre_id"], name: "index_facility_genres_on_facility_id_and_genre_id", unique: true
    t.index ["facility_id"], name: "index_facility_genres_on_facility_id"
    t.index ["genre_id"], name: "index_facility_genres_on_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body", null: false
    t.string "review_image"
    t.bigint "facility_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_reviews_on_facility_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "bookmarks", "facilities"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "facilities", "prefectures"
  add_foreign_key "facility_genres", "facilities"
  add_foreign_key "facility_genres", "genres"
  add_foreign_key "reviews", "facilities"
  add_foreign_key "reviews", "users"
end
