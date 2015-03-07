class Gene < ActiveRecord::Base
  belongs_to :sequence
  has_many :hits, as: :subject

  validates :sequence_id, presence: true
end
