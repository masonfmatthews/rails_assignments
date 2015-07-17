class Award < ActiveRecord::Base
  belongs_to :student

  validates :student, presence: true

  def teacher
    student.teacher
  end
end
