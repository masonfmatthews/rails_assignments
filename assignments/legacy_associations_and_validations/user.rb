class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :course_instructors, foreign_key: "instructor_id", dependent: :restrict_with_error
  has_many :courses_taught, through: :course_instructors, source: :course
  has_many :course_enrollments, through: :courses_taught, source: :course_students
  has_many :assignments_given, through: :courses_taught, source: :assignments

  has_many :course_students, foreign_key: "student_id", dependent: :restrict_with_error
  has_many :courses_taken, through: :course_students, source: :course
  has_many :assignments_taken, through: :courses_taken, source: :assignments
  has_many :awarded_achievements, through: :course_students, source: :awarded_achievements

  has_many :assignment_grades, through: :course_students, dependent: :restrict_with_error
  has_many :assignment_question_grades, through: :assignment_grades

  belongs_to :school

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :code, uniqueness: true, allow_blank: true, allow_nil: true
  validates :photo_url, format: {with: /\Ahttps?:\/\//, message: "must start with http:// or https://"}, allow_blank: true

  scope :want_to_be_instructors, -> { where(wants_to_be_instructor: true) }
  scope :instructors_for_school_id, ->(school_id) { where(school_id: school_id, instructor: true) }

  default_scope { order('last_name, first_name') }

  def full_name
    "#{title + " " if title}#{first_name} #{padded_middle_initial}#{last_name}"
  end

  def school_name
    school ? school.name : "None"
  end

  def middle_initial
    middle_name ? middle_name.first : nil
  end

  def student?
    number_of_courses_taken > 0
  end

  def awarded?(achievement)
    cs = CourseStudent.where(course: achievement.course, student: self).first
    aa = AwardedAchievement.where(course_student: cs, achievement: achievement).first
    aa && aa.awarded
  end

  def enrolled?(course)
    courses_taken.include?(course)
  end

  def teaching?(course)
    courses_taught.include?(course)
  end

  def participating?(course)
    enrolled?(course) || teaching?(course)
  end

  def grade(course)
    course_student_for(course).grade
  end

  def course_student_for(course)
    course_students.where(course_id: course.id).first
  end

  def grade_on_assignment(assignment)
    ag = assignment_grades.graded.where(assignment: assignment).first
    ag.grade if ag
  end

  #I went the WRONG WAY on this method to have a good case study to analyze soon.
  def current_grade_on_question(assignment_question)
    course_student = CourseStudent.where(student_id: id, course_id: assignment_question.assignment.course_id).first
    assignment_grade = AssignmentGrade.where(assignment_id: assignment_question.assignment_id,
      course_student_id: course_student.id).first
    return nil if assignment_grade.blank?
    assignment_question_grade = AssignmentQuestionGrade.where(assignment_grade_id: assignment_grade.id,
      assignment_question_id: assignment_question.id).first
    assignment_question_grade.grade if assignment_question_grade
  end

  def letter_grade(course)
    course_students.where(course_id: course.id).first.letter_grade
  end

  def min_grade(course)
    course_students.where(course_id: course.id).first.min_grade
  end

  def max_grade(course)
    course_students.where(course_id: course.id).first.max_grade
  end

  def percent_graded(course)
    course_students.where(course_id: course.id).first.percent_graded
  end

  def completed_assignment?(assignment)
    assignment_grades.where(["assignment_id = ? AND submitted_at IS NOT NULL", assignment.id]).exists?
  end

  def overdue_assignment?(assignment)
    overdue_assignments.include?(assignment)
  end

  def overdue_assignments
    assignments_taken.select {|a| a.due_at < Time.now && a.students_can_submit &&
      assignment_grades.where(["assignment_id = ? AND submitted_at IS NOT NULL", a.id]).blank? }
  end

  def ungraded_assignment?(assignment)
    ungraded_assignments.include?(assignment)
  end

  def ungraded_assignments
    assignments_given.select {|a| a.due_at < Time.now && !a.grades_released }
  end

  def overdue_or_active_assignments
    overdue_assignments + assignments_taken.active_for_students
  end

  def number_of_courses_taken
    course_students.count
  end

  def number_of_requests
    number = 0
    if admin?
      number += User.want_to_be_instructors.length
    end
    if instructor?
      number += course_enrollments.unapproved.length
    end
    number
  end

  private

  def padded_middle_initial
    middle_initial.blank? ? "" : "#{middle_initial}. "
  end
end
