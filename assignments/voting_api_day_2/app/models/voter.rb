class Voter < ActiveRecord::Base
  validates :name, presence: true
  has_one :vote
end
