class CourseInstructor < ActiveRecord::Base
  belongs_to :course, inverse_of: :course_instructors
  belongs_to :instructor, class_name: "User"

  validates :course, presence: true
  validates :instructor, presence: true
  validates :primary, uniqueness: {scope: :course, allow_blank: true}
  validates :instructor, uniqueness: {scope: :course}
end
