require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'development.sqlite3'
)

require './assignment_grade.rb'
require './assignment.rb'
require './course_instructor.rb'
require './course_student.rb'
require './course.rb'
require './lesson.rb'
require './reading.rb'
require './school.rb'
require './term.rb'
require './user.rb'
