require 'test_helper'

class BidTest < ActiveSupport::TestCase
  test "bid cannot be created without fields" do
    refute Bid.new.save
  end

  test "bid can be created for above starting amount" do
    assert Bid.new(item: items(:phone), amount: 500).save
  end

  test "bid cannot be created for below starting amount" do
    refute Bid.new(item: items(:phone), amount: 1).save
  end

  test "bid cannot be created for below max bid" do
    assert Bid.new(item: items(:phone), amount: 500).save
    refute Bid.new(item: items(:phone), amount: 400).save
    refute Bid.new(item: items(:phone), amount: 500).save
  end


end
