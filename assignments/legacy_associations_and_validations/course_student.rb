class CourseStudent < ActiveRecord::Base
  belongs_to :course
  belongs_to :student, class_name: "User"
  has_many :assignment_grades, dependent: :restrict_with_error
  has_many :awarded_achievements, dependent: :destroy
  has_many :time_cards, dependent: :destroy
  has_many :feedback_answers, dependent: :destroy

  validates :course, presence: true
  validates :student, presence: true
  validates :student, uniqueness: {scope: :course_id}

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }

  delegate :code_and_name, :color, to: :course, prefix: true
  delegate :full_name, :first_name, :last_name, :email, to: :student
  delegate :grading_method, to: :course

  def awarded_achievement_for(achievement)
    if achievement
      awarded_achievements.where(achievement_id: achievement.id).first
    end
  end

  def percent_graded
    assignment_grades.graded.sum {|ag| ag.percent_of_grade}
  end

  def assignment_grade
    #This method does not simply call percent_graded to get the total, as that
    #  would require performing the loop twice.
    weighted_total = 0
    percent_total = 0
    assignment_grades.graded.each do |ag|
      weighted_total += ag.grade * ag.percent_of_grade
      percent_total += ag.percent_of_grade
    end
    percent_total > 0 ? weighted_total/percent_total : 100
  end

  def achievement_grade
    total = 0
    awarded_achievements.awarded.each {|a| total += a.achievement.points}
    total
  end

  def calculated_grade
    if course.achievement_grading?
      achievement_grade
    else
      assignment_grade
    end
  end

  def grade
    final_grade || calculated_grade
  end

  def percent_graded
    assignment_grades.graded.sum {|ag| ag.percent_of_grade}
  end

  def letter_grade
    course.letter_for_grade(grade)
  end

  def max_grade
    final_grade || (100-percent_graded) + min_grade
  end

  def min_grade
    final_grade || calculated_grade*percent_graded/100
  end

  def total_time
    time_cards.completed.sum &:duration_in_hours
  end

  def time_this_week
    time_cards.completed_this_week.sum &:duration_in_hours
  end

  def check_in_or_out
    if (open_card = time_cards.open.first)
      open_card.update_attribute(:ended_at, Time.now)
    else
      time_cards << TimeCard.new(started_at: Time.now)
      save!
    end
  end
end
