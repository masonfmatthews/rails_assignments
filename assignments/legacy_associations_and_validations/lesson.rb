class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :meeting_lessons, dependent: :destroy
  has_many :meetings, -> {order :held_at}, through: :meeting_lessons
  has_many :readings, dependent: :destroy
  has_many :child_lessons, -> {order :id}, class_name: "Lesson", foreign_key: "parent_lesson_id", dependent: :destroy
  belongs_to :parent_lesson, class_name: "Lesson", foreign_key: "parent_lesson_id"
  belongs_to :pre_class_assignment, class_name: "Assignment", foreign_key: "pre_class_assignment_id"
  belongs_to :in_class_assignment, class_name: "Assignment", foreign_key: "in_class_assignment_id"

  validates :name, presence: true

  delegate :code_and_name, to: :course, prefix: true

  accepts_nested_attributes_for :readings,
      :allow_destroy => true,
      :reject_if     => proc { |attributes| attributes['caption'].blank? && attributes['url'].blank? }

  scope :roots, -> { where("parent_lesson_id IS NULL") }
  scope :without_day_assignments, -> { where("day_assignment_id IS NULL") }
  scope :without_night_assignments, -> { where("night_assignment_id IS NULL") }

  after_save :update_cached_values

  def self.linked_to_assignment(assignment)
    found_lesson = where(pre_class_assignment_id: assignment.id).first
    found_lesson ||= where(in_class_assignment_id: assignment.id).first
  end

  def update_cached_values
    if name_changed?
      update_activity_names
    end
  end

  def update_activity_names
    if pre_class_assignment
      pre_class_assignment.name = activity_name(false)
      pre_class_assignment.save!
    end
    if in_class_assignment
      in_class_assignment.name = activity_name(true)
      in_class_assignment.save!
    end
  end

  def update_activity_times
    if pre_class_assignment
      pre_class_assignment.active_at = activity_active_at(false)
      pre_class_assignment.due_at    = activity_due_at(false)
      pre_class_assignment.save!
    end
    if in_class_assignment
      in_class_assignment.active_at = activity_active_at(true)
      in_class_assignment.due_at    = activity_due_at(true)
      in_class_assignment.save!
    end
  end

  def descendant_tree
    children = []
    child_lessons.each do |l|
      children << l.descendant_tree
    end
    children = children.compact.sort_by{|c| c[:heldat]}

    # Set my datetime to my earliest child's if I don't have a datetime of my own.
    # The -1 prevents the parent's modal from showing up when the child's modal should.
    heldat = held_at_integer || (children.present? && (children.first)[:heldat] - 1)

    if heldat && heldat > 0
      return {name: name,
        description: description,
        heldat: heldat,
        contents: children}
    end
  end

  def held_at_integer
    meetings.first.held_at_integer if meetings.present?
  end

  def parent_name
    parent_lesson ? parent_lesson.name : "N/A"
  end

  def clone
    new_lesson = dup
    new_lesson.readings = readings.map {|r| r.clone}
    new_lesson
  end

  def copy_tree(new_course)
    new_lesson = clone
    new_lesson.course = new_course
    new_lesson.save!
    child_lessons.each do |l|
      new_lesson.child_lessons << l.copy_tree(new_course)
    end
    new_lesson.save!
    new_lesson
  end

  def activity_name(in_class)
    (in_class ? "IN" : "BEFORE") + " class: " + name
  end

  def activity_active_at(in_class)
    if meetings.blank?
      course.term.ends_on # So that they don't all show as "In Progress"
    elsif in_class
      meetings.first.held_at
    else
      meetings.first.preceding_meeting_held_at + 1.minute
    end
  end

  def activity_due_at(in_class)
    if meetings.blank?
      course.term.ends_on
    elsif in_class
      meetings.last.held_at + 2.hours
    else
      meetings.first.held_at
    end
  end

  def correct_in_class_assignment?(assignment)
    in_class_assignment == assignment
  end

end
