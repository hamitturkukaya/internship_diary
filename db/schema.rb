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

ActiveRecord::Schema.define(:version => 20120630191915) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "diary_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["diary_id"], :name => "index_comments_on_diary_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "diaries", :force => true do |t|
    t.integer  "internship_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "content"
    t.boolean  "private"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "diaries", ["internship_id"], :name => "index_diaries_on_internship_id"
  add_index "diaries", ["user_id"], :name => "index_diaries_on_user_id"

  create_table "educations", :force => true do |t|
    t.integer  "user_id"
    t.string   "university", :default => "", :null => false
    t.string   "faculty",    :default => "", :null => false
    t.string   "department", :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "educations", ["user_id"], :name => "index_educations_on_user_id"

  create_table "internships", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "company"
    t.string   "internship_type"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "internships", ["user_id"], :name => "index_internships_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "",    :null => false
    t.string   "surname",                :default => "",    :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "admin",                  :default => false, :null => false
    t.boolean  "active",                 :default => true,  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
