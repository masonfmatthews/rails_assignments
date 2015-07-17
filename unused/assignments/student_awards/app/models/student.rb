class Student < ActiveRecord::Base
  has_many :awards
  belongs_to :teacher
end
