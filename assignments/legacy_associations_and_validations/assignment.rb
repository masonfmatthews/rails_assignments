class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :assignment_questions, -> {order :order_number}, dependent: :destroy
  has_many :assignment_grades, dependent: :destroy

  validates :course_id, presence: true
  validates :name, presence: true
  validates :active_at, presence: true
  validates :due_at, presence: true
  validates :percent_of_grade, presence: true

  validate :active_no_later_than_due?

  scope :active_for_students, -> { where("active_at <= ? AND due_at >= ? AND students_can_submit = ?", Time.now, Time.now, true) }

  delegate :code_and_name, :color, to: :course, prefix: true

  accepts_nested_attributes_for :assignment_questions,
      :allow_destroy => true,
      :reject_if     => :all_blank

  def active_no_later_than_due?
    if active_at? && due_at? && active_at > due_at
      errors.add(:active_at, "must be no later than due at.")
    end
  end

  def status(user = nil)
    AssignmentStatus.new(assignment: self, user: user)
  end

  def turn_in(answers, user, final=true)
    if can_be_turned_in_by(user)
      course_student = CourseStudent.where(student: user, course: course).first
      assignment_grade = AssignmentGrade.where(assignment: self,
        course_student: course_student).first_or_create!

      assignment_grade.submitted_at = Time.now if final

      unless answers.blank?
        answers.each do |k,v|
          aqg = AssignmentQuestionGrade.where(assignment_question_id: k.to_i,
            assignment_grade: assignment_grade).first_or_create!
            aqg.answer = v
            aqg.save!
        end
      end

      assignment_grade.save!
    end
  end

  def can_be_turned_in_by(user)
    students_can_submit && user && user.enrolled?(course) && status(user).overdue_or_in_progress?
  end

  def has_been_answered_by(user)
    if user
      if (course_student = CourseStudent.where(student: user, course: course).first)
        assignment_grades.where(course_student_id: course_student.id).first
      end
    end
  end

  def letter_grade_for(user)
    if (assignment_grade = has_been_answered_by(user))
      assignment_grade.letter_grade
    end
  end

  def copy_with_questions(new_course)
    new_assignment = dup
    new_assignment.course = new_course
    new_assignment.due_at = shift_by_years(due_at)
    new_assignment.active_at = [shift_by_years(active_at), new_assignment.due_at].min
    new_assignment.save!

    new_assignment.assignment_questions = assignment_questions.map {|aq| aq.dup}
    new_assignment.save!
    new_assignment
  end

  private

  def shift_by_years(old_date)
    new_date = old_date
    while new_date < Time.now do
      new_date += 1.year
    end
    new_date
  end

end
