class Grade < ActiveRecord::Base
  belongs_to :student
  
  validates :student, presence: true
end
