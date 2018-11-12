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

ActiveRecord::Schema.define(version: 20181109065138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisement_images", force: true do |t|
    t.string "image_id"
  end

  create_table "courses", force: true do |t|
    t.string  "name"
    t.string  "image_id"
    t.string  "introduction"
    t.text    "description"
    t.decimal "base_price",       default: 0.0, null: false
    t.integer "issue_count"
    t.integer "subscriber_count"
  end

  create_table "fancylab_videos", force: true do |t|
    t.string  "video_id"
    t.string  "video_title"
    t.string  "video_name"
    t.string  "video_url"
    t.integer "video_likes"
  end

  create_table "shop_urls", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end