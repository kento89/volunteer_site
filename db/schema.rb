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

ActiveRecord::Schema.define(version: 2021_08_24_110606) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applies", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "volunteer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_applies_on_customer_id"
    t.index ["volunteer_id"], name: "index_applies_on_volunteer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "postal_number", null: false
    t.string "address", null: false
    t.integer "phone_number", null: false
    t.boolean "experience", default: false, null: false
    t.text "comment"
    t.boolean "volunteer_status", default: false, null: false
    t.boolean "customer_status", default: false, null: false
    t.integer "volunteer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "recruiter_id"
    t.integer "room_id"
    t.boolean "checked", default: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id"
    t.integer "visited_id"
    t.integer "room_id"
    t.integer "message_id"
    t.string "action"
    t.boolean "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "postal_number", null: false
    t.string "address", null: false
    t.integer "phone_number", null: false
    t.boolean "recruiter_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_recruiters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "customer_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "volunteer_id"
  end

  create_table "user_rooms", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "recruiter_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "room_id", "recruiter_id"], name: "index_user_rooms_on_customer_id_and_room_id_and_recruiter_id", unique: true
    t.index ["customer_id"], name: "index_user_rooms_on_customer_id"
    t.index ["recruiter_id"], name: "index_user_rooms_on_recruiter_id"
    t.index ["room_id"], name: "index_user_rooms_on_room_id"
  end

  create_table "volunteer_customers", force: :cascade do |t|
    t.integer "volunteer_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_volunteer_customers_on_customer_id"
    t.index ["volunteer_id"], name: "index_volunteer_customers_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "name", null: false
    t.text "a_litle_explanation", null: false
    t.text "explanation", null: false
    t.string "place", null: false
    t.datetime "time", null: false
    t.integer "people", null: false
    t.text "merit", null: false
    t.string "necessary_item", null: false
    t.text "important_point", null: false
    t.text "comment", null: false
    t.datetime "limit", null: false
    t.integer "genre", default: 0, null: false
    t.boolean "recruiter_status", default: true, null: false
    t.boolean "volunteer_status", default: true, null: false
    t.integer "recruiter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.index ["recruiter_id"], name: "index_volunteers_on_recruiter_id"
  end

end
