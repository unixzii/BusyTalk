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

ActiveRecord::Schema.define(version: 20151219122823) do

  create_table "db_locks", force: :cascade do |t|
    t.string "db_name", limit: 255
  end

  create_table "forum_categories", force: :cascade do |t|
    t.string "title",       limit: 255
    t.string "color",       limit: 255
    t.text   "description", limit: 65535
    t.text   "admins",      limit: 65535
  end

  create_table "forum_comments", force: :cascade do |t|
    t.text    "content",          limit: 65535
    t.integer "forum_post_id",    limit: 4
    t.integer "forum_comment_id", limit: 4
  end

  create_table "forum_likes", force: :cascade do |t|
    t.integer "type",             limit: 4
    t.integer "user_id",          limit: 4
    t.integer "forum_post_id",    limit: 4
    t.integer "forum_comment_id", limit: 4
  end

  create_table "forum_posts", force: :cascade do |t|
    t.text     "title",             limit: 16777215
    t.datetime "last_commented_at"
    t.integer  "forum_category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content",           limit: 65535
    t.integer  "user_id",           limit: 4
  end

  create_table "login_states", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "secret",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.text     "content",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.text     "description",     limit: 65535
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",           limit: 255
  end

end
