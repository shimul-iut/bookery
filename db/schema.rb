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

ActiveRecord::Schema.define(version: 2022_02_08_092634) do

  create_table "book_borrowers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_list_id"
    t.integer "book_owner_id"
    t.integer "borrow_for_days"
    t.string "has_returned", default: "f"
    t.string "boolean", default: "f"
    t.integer "extended_days", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_list_id"], name: "index_book_borrowers_on_book_list_id"
    t.index ["book_owner_id"], name: "index_book_borrowers_on_book_owner_id"
    t.index ["user_id"], name: "index_book_borrowers_on_user_id"
  end

  create_table "book_lists", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "author"
    t.string "unique_id"
    t.string "image_url"
    t.string "isbn"
    t.integer "genre_id"
    t.integer "book_owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_owner_id"], name: "index_book_lists_on_book_owner_id"
    t.index ["genre_id"], name: "index_book_lists_on_genre_id"
  end

  create_table "book_owners", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_list_id"
    t.boolean "is_active", default: true
    t.boolean "is_borrowed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_list_id"], name: "index_book_owners_on_book_list_id"
    t.index ["user_id"], name: "index_book_owners_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.float "popularity_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string "logtype"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "company_email"
    t.string "company_id"
    t.string "company_role"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
