class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :candidate
  validates :voter_id, uniqueness: true
end
