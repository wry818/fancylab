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

ActiveRecord::Schema.define(version: 20181115082024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisement_images", force: true do |t|
    t.string   "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.string   "cover_image_id"
    t.string   "introduction"
    t.text     "description"
    t.decimal  "base_price",       default: 0.0,   null: false
    t.integer  "issue_count"
    t.integer  "subscriber_count"
    t.string   "slug"
    t.boolean  "deleted",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["slug"], name: "index_courses_on_slug", unique: true, using: :btree

  create_table "courses_sub_courses", id: false, force: true do |t|
    t.integer "course_id",     null: false
    t.integer "sub_course_id", null: false
    t.integer "browser_count"
  end

  add_index "courses_sub_courses", ["course_id", "sub_course_id"], name: "index_courses_sub_courses_on_course_id_and_sub_course_id", using: :btree
  add_index "courses_sub_courses", ["sub_course_id", "course_id"], name: "index_courses_sub_courses_on_sub_course_id_and_course_id", using: :btree

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

  create_table "sub_courses", force: true do |t|
    t.string   "title"
    t.string   "cover_image_id"
    t.text     "description"
    t.text     "preview_description"
    t.decimal  "base_price",          default: 0.0,   null: false
    t.boolean  "sell_alone",          default: false
    t.string   "slug"
    t.integer  "course_type"
    t.integer  "browser_count"
    t.boolean  "deleted",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_courses", ["slug"], name: "index_sub_courses_on_slug", unique: true, using: :btree

end
