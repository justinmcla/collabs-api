# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_08_024924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.string "highest_level"
    t.string "institution"
    t.string "educatable_type", null: false
    t.bigint "educatable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["educatable_type", "educatable_id"], name: "index_educations_on_educatable_type_and_educatable_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "employer"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "jobable_type", null: false
    t.bigint "jobable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jobable_type", "jobable_id"], name: "index_jobs_on_jobable_type_and_jobable_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "lang"
    t.string "proficiency"
    t.string "languageable_type", null: false
    t.bigint "languageable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["languageable_type", "languageable_id"], name: "index_languages_on_languageable_type_and_languageable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "locatable_type", null: false
    t.bigint "locatable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.date "birthdate"
    t.text "about"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "social_links", force: :cascade do |t|
    t.string "handle"
    t.string "provider"
    t.string "linkable_type", null: false
    t.bigint "linkable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["linkable_type", "linkable_id"], name: "index_social_links_on_linkable_type_and_linkable_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "taggable_type", null: false
    t.bigint "taggable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["taggable_type", "taggable_id"], name: "index_tags_on_taggable_type_and_taggable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "sub"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uuid"
  end

  add_foreign_key "profiles", "users"
end
