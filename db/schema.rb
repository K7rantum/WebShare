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

ActiveRecord::Schema.define(:version => 20121124025817) do

  create_table "projects", :force => true do |t|
    t.string   "projectName"
    t.string   "category"
    t.integer  "numberOfFiles"
    t.integer  "numberOfLikes"
    t.integer  "numberOfComments"
    t.string   "thumbnailPath"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "projectFile_file_name"
    t.string   "projectFile_content_type"
    t.integer  "projectFile_file_size"
    t.datetime "projectFile_updated_at"
    t.string   "thumbnailFile_file_name"
    t.string   "thumbnailFile_content_type"
    t.integer  "thumbnailFile_file_size"
    t.datetime "thumbnailFile_updated_at"
    t.integer  "user_id"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "password"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "salt"
    t.string   "encrypted_password"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
