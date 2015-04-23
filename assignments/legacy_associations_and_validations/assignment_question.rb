class AssignmentQuestion < ActiveRecord::Base
  belongs_to :assignment
  has_many :assignment_question_grades, dependent: :destroy

  validates :points, presence: true
  validates :order_number, presence: true
  validates :question, presence: true

  def assignment_question_grade_for(assignment_grade)
    if assignment_grade
      assignment_question_grades.where(assignment_grade_id: assignment_grade.id).first
    end
  end

end
