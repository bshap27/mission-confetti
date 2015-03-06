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

ActiveRecord::Schema.define(version: 20150306194256) do

  create_table "episodes", force: :cascade do |t|
    t.string  "title"
    t.string  "url"
    t.integer "podcast_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string  "title"
    t.integer "identifier"
    t.string  "image_url"
    t.string  "feed_url"
    t.string  "summary"
  end

  create_table "podcasts_topics", force: :cascade do |t|
    t.integer "podcast_id"
    t.integer "topic_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "podcast_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subtopics", force: :cascade do |t|
    t.string  "name"
    t.integer "topic_id"
    t.string  "url"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "url"
  end

  create_table "user_podcasts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "podcast_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
