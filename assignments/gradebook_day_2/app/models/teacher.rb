class Teacher < ActiveRecord::Base
  has_secure_password
  has_many :students
end
