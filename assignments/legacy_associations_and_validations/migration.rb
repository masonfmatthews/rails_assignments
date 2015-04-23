require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'development.sqlite3'
)

class ApplicationMigration < ActiveRecord::Migration
  def change
    create_table "assignment_grades", force: true do |t|
      t.integer  "assignment_id"
      t.integer  "course_student_id"
      t.float    "final_grade"
      t.datetime "submitted_at"
      t.text     "comments"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "assignment_questions", force: true do |t|
      t.integer  "assignment_id"
      t.text     "question"
      t.integer  "points"
      t.integer  "order_number"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "assignments", force: true do |t|
      t.string   "name"
      t.integer  "course_id"
      t.datetime "active_at"
      t.datetime "due_at"
      t.boolean  "grades_released"
      t.boolean  "students_can_submit"
      t.decimal  "percent_of_grade",    precision: 5, scale: 2
      t.datetime "created_at"
      t.datetime "updated_at"
      t.float    "maximum_grade"
    end

    create_table "course_instructors", force: true do |t|
      t.integer  "course_id"
      t.integer  "instructor_id"
      t.boolean  "primary"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "course_students", force: true do |t|
      t.integer  "student_id"
      t.integer  "course_id"
      t.float    "final_grade"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "approved"
    end

    create_table "courses", force: true do |t|
      t.string   "name"
      t.string   "course_code"
      t.string   "color"
      t.string   "period"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "term_id"
      t.boolean  "public",              default: true
      t.string   "grading_method",      default: "Assignment"
      t.boolean  "use_time_cards"
      t.boolean  "use_daily_questions"
      t.boolean  "use_reveal_slides"
      t.boolean  "use_meeting_video"
      t.boolean  "use_course_feedback"
    end

    create_table "grade_thresholds", force: true do |t|
      t.integer  "course_id"
      t.float    "grade"
      t.string   "letter"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "lessons", force: true do |t|
      t.integer  "course_id"
      t.integer  "parent_lesson_id"
      t.string   "name"
      t.text     "description"
      t.text     "outline"
      t.text     "lead_in_question"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "pre_class_assignment_id"
      t.integer  "in_class_assignment_id"
      t.text     "slide_html"
    end

    create_table "readings", force: true do |t|
      t.integer  "lesson_id"
      t.string   "caption"
      t.string   "url"
      t.integer  "order_number"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "before_lesson", default: false
    end

    create_table "schools", force: true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "terms", force: true do |t|
      t.string   "name"
      t.date     "starts_on"
      t.date     "ends_on"
      t.integer  "school_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "users", force: true do |t|
      t.string   "title"
      t.string   "first_name"
      t.string   "middle_name"
      t.string   "last_name"
      t.string   "phone"
      t.string   "office"
      t.string   "office_hours"
      t.string   "photo_url"
      t.text     "description"
      t.boolean  "admin"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0,  null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.boolean  "wants_to_be_instructor"
      t.boolean  "instructor"
      t.integer  "school_id"
      t.string   "code"
    end
  end
end

# To execute this in IRB, type:
#
# require './migration'
# ApplicationMigration.migrate(:up)

# To roll this back in IRB, type:
#
# require './migration'
# ApplicationMigration.migrate(:down)
