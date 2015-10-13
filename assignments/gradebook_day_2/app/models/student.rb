class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :parents
  has_many :grades

  validates :teacher, presence: true
end
