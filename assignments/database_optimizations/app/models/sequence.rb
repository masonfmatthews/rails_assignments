class Sequence < ActiveRecord::Base
  belongs_to :assembly
  has_many :genes

  validates :assembly_id, presence: true
end
