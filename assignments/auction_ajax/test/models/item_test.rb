require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "highest bid" do
    Bid.create(item: items(:phone), amount: 500)
    Bid.create(item: items(:phone), amount: 600)
    Bid.create(item: items(:phone), amount: 900)
    assert_equal 900, items(:phone).highest_bid_amount
  end

  test "bid cannot be created without fields" do
    refute Item.new.save
  end
end
