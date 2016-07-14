# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160714013804) do

  create_table "items", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "url",          limit: 255
    t.integer  "status",       limit: 4,   default: 1
    t.integer  "order_number", limit: 4
    t.integer  "pid",          limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "action",      limit: 255
    t.string   "subject",     limit: 255
    t.string   "description", limit: 255
    t.string   "module_name", limit: 255
    t.string   "menu_name",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "roles_items", force: :cascade do |t|
    t.integer "role_id", limit: 4
    t.integer "item_id", limit: 4
  end

  add_index "roles_items", ["item_id"], name: "index_roles_items_on_item_id", using: :btree
  add_index "roles_items", ["role_id"], name: "index_roles_items_on_role_id", using: :btree

  create_table "roles_permissions", force: :cascade do |t|
    t.integer "role_id",       limit: 4
    t.integer "permission_id", limit: 4
  end

  add_index "roles_permissions", ["permission_id", "role_id"], name: "index_roles_permissions_on_permission_id_and_role_id", using: :btree
  add_index "roles_permissions", ["role_id", "permission_id"], name: "index_roles_permissions_on_role_id_and_permission_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "f_code",                 limit: 255
    t.string   "company",                limit: 255
    t.string   "phone",                  limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "status",                 limit: 4,   default: 1
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["role_id"], name: "index_users_roles_on_role_id", using: :btree
  add_index "users_roles", ["user_id"], name: "index_users_roles_on_user_id", using: :btree

end
