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

ActiveRecord::Schema.define(:version => 20151209220834) do

  create_table "accounts", :force => true do |t|
    t.string   "user"
    t.string   "locker"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "expire_date"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "feeds", :force => true do |t|
    t.string   "msg"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lockers", :force => true do |t|
    t.string   "code"
    t.string   "owner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "raffles", :force => true do |t|
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "requirement_raffles", :force => true do |t|
    t.datetime "finish"
    t.datetime "start"
    t.string   "locker"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "password_digest"
    t.string   "documento"
    t.string   "telefone"
    t.boolean  "admin"
    t.integer  "raffle_id"
    t.integer  "requirement_raffle_id"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["documento"], :name => "index_users_on_documento", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
