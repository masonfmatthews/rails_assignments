class Teacher < ActiveRecord::Base
  has_many :students
  has_many :awards, through: :students
end
