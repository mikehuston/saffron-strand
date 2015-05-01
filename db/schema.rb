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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150501080650) do

  create_table "events", :force => true do |t|
    t.string  "event_type"
    t.integer "head_count"
    t.integer "user_id"
    t.string  "status"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.decimal  "price"
    t.string   "category"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "food_type"
    t.boolean  "vegetarian"
  end

  create_table "items_menus", :id => false, :force => true do |t|
    t.integer "menu_id"
    t.integer "item_id"
  end

  add_index "items_menus", ["item_id"], :name => "index_items_menus_on_item_id"
  add_index "items_menus", ["menu_id", "item_id"], :name => "index_items_menus_on_menu_id_and_item_id"

  create_table "menus", :force => true do |t|
    t.string  "name"
    t.integer "budget_per_person"
    t.integer "event_id"
    t.boolean "sample"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.decimal  "phone"
    t.text     "address"
    t.boolean  "admin"
    t.string   "key"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
