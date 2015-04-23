class Term < ActiveRecord::Base
  belongs_to :school
  has_many :courses, dependent: :restrict_with_error

  validates :name, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validates :school_id, presence: true

  default_scope { order('ends_on DESC') }

  scope :for_school_id, ->(school_id) { where("school_id = ?", school_id) }

  def school_name
    school ? school.name : "None"
  end
end
