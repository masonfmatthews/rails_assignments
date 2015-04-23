class Reading < ActiveRecord::Base
  belongs_to :lesson

  validates :order_number, presence: true
  validates :url, format: {with: /\Ahttps?:\/\//, message: "must start with http:// or https://"}, allow_blank: true

  default_scope { order('order_number') }

  scope :pre, -> { where("before_lesson = ?", true) }
  scope :post, -> { where("before_lesson != ?", true) }

  def clone
    dup
  end
end
