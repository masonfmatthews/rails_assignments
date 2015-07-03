require 'minitest/autorun'
require 'minitest/pride'

# Write a method which returns a hash.

# WRITE YOUR CODE HERE.  Name your method `get_hash`.


class HashChallenge < MiniTest::Test

  def test_keys
    assert get_hash.keys.include?("Pizza")
    assert get_hash.keys.include?("French Fries")
    assert get_hash.keys.include?("Broccoli")
    refute get_hash.keys.include?("Bricks")
    refute get_hash.keys.include?("Cars")
  end

  def test_values
    assert get_hash.values.include?("Unhealthy")
    assert get_hash.values.include?("Okay")
    assert get_hash.values.include?("Healthy")
    refute get_hash.values.include?("Blue")
    refute get_hash.values.include?("Sharp")
  end

  def test_lengths
    assert_equal 4, get_hash.length
    assert_equal 4, get_hash.values.length
  end

  def test_pairs
    assert_equal "Healthy", get_hash["Broccoli"]
    assert_equal "Healthy", get_hash["Chocolate"]
    assert_equal nil, get_hash["Carrots"]
  end

  def test_each
    get_hash.each do |k, v|
      if k.length > 9
        assert_equal "Okay", v
      end
    end
  end

end
