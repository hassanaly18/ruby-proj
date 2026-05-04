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

ActiveRecord::Schema[8.1].define(version: 2026_05_04_131752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.boolean "featured"
    t.datetime "published_at"
    t.string "slug"
    t.string "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "word_count"
  end

  create_table "book_orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "author"
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "categories_tasks", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "task_id", null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "project_id", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_milestones_on_project_id"
  end

  create_table "new_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "context"
    t.datetime "created_at", null: false
    t.boolean "published"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "inventory_count", default: 0
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "products_users", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.bigint "product_id", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_subscribers_on_product_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.decimal "cost", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "due_date"
    t.integer "priority", null: false
    t.string "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["status"], name: "index_tasks_on_status"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "milestones", "projects"
  add_foreign_key "sessions", "users"
  add_foreign_key "subscribers", "products"
  add_foreign_key "tasks", "users"
end
