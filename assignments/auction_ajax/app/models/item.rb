class Item < ActiveRecord::Base
  has_many :bids

  validates :name, presence: true
  validates :image_url, presence: true
  validates :starting_price, presence: true, numericality: {greater_than: 0}

  def highest_bid_amount
    return 0 if bids.empty?
    bids.order(amount: :desc).first.amount
  end

  def next_bid_amount
    [starting_price, highest_bid_amount + 10].max
  end
end
