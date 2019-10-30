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

ActiveRecord::Schema.define(version: 2019_10_30_123810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "click_counters", force: :cascade do |t|
    t.bigint "keyword_id"
    t.integer "click_count"
    t.index ["keyword_id"], name: "index_click_counters_on_keyword_id", unique: true
  end

  create_table "keywords", force: :cascade do |t|
    t.string "text", null: false
    t.integer "page", default: 1, null: false
    t.integer "weight", default: 10, null: false
    t.bigint "url_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url_id"], name: "index_keywords_on_url_id"
  end

  create_table "simple_urls", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "alias"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alias"], name: "index_simple_urls_on_alias", unique: true
    t.index ["user_id", "name"], name: "index_simple_urls_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_simple_urls_on_user_id"
  end

  create_table "urls", force: :cascade do |t|
    t.string "name", null: false
    t.string "shortened_code", limit: 6, null: false
    t.string "url", null: false
    t.string "ref", null: false
    t.string "extra", null: false
    t.string "ie", default: "UTF8"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shortened_code"], name: "index_urls_on_shortened_code", unique: true
    t.index ["user_id"], name: "index_urls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
