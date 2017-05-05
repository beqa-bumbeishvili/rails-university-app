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

ActiveRecord::Schema.define(version: 20170505060547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string  "name"
    t.integer "code"
    t.integer "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string  "name"
    t.integer "code"
  end

  create_table "lecturers", force: :cascade do |t|
    t.string  "name"
    t.string  "last_name"
    t.integer "school_id"
    t.index ["school_id"], name: "index_lecturers_on_school_id", using: :btree
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "name"
    t.integer  "passing_grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "teacher_id"
    t.index ["teacher_id"], name: "index_lectures_on_teacher_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_grades", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "lecture_id"
    t.integer  "student_grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["lecture_id"], name: "index_student_grades_on_lecture_id", using: :btree
    t.index ["student_id"], name: "index_student_grades_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.integer  "school_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "created_from"
    t.index ["school_id"], name: "index_students_on_school_id", using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string  "name"
    t.string  "last_name"
    t.integer "school_id"
    t.index ["school_id"], name: "index_teachers_on_school_id", using: :btree
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "lecturers", "schools"
  add_foreign_key "lectures", "teachers"
  add_foreign_key "student_grades", "lectures"
  add_foreign_key "student_grades", "students"
  add_foreign_key "students", "schools"
  add_foreign_key "teachers", "schools"
end
