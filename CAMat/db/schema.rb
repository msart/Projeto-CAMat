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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20150929135725) do
=======
ActiveRecord::Schema.define(:version => 20150929183650) do

  create_table "accounts", :force => true do |t|
    t.string   "user"
    t.string   "locker"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "expire_date"
  end
>>>>>>> 73cdda30ea4ea8737b279635140b9e9d423e0f9f

  create_table "lockers", :force => true do |t|
    t.string   "code"
    t.string   "owner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "documento"
    t.string   "telefone"
    t.boolean  "admin"
  end

  add_index "users", ["documento"], :name => "index_users_on_documento", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
