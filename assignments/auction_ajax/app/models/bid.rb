class Bid < ActiveRecord::Base
  belongs_to :item

  validates :item, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}

  validate :bid_must_exceed_prior_bids, on: :create
  validate :bid_must_exceed_starting_price, on: :create

  def bid_must_exceed_prior_bids
    if amount && amount <= highest_bid_amount
      errors.add(:amount, "must exceed all prior bids.")
    end
  end

  def bid_must_exceed_starting_price
    if amount && item && amount <= item.starting_price
      errors.add(:amount, "must exceed starting price.")
    end
  end

  def highest_bid_amount
    return 0 unless item
    item.highest_bid_amount
  end
end
