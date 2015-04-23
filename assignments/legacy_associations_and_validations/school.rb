class School < ActiveRecord::Base
  has_many :users, dependent: :restrict_with_error
  has_many :terms, dependent: :destroy

  validates :name, presence: true

  default_scope { order('name') }
end
