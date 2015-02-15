require 'minitest/autorun'
require 'minitest/pride'

# Write a method which accepts an array and returns a sum of the elements in the
# array.  Specifying a second parameter (e.g. 3) will allow you to sum all the
# items starting from index 3. Specifying three parameters will allow you to sum
# between two indices (e.g. everything between 3 and 6, inclusive).

# WRITE YOUR CODE HERE.  Name your method `subsum`.


class OptionalParametersChallenge < MiniTest::Test

  def test_sum
    assert_equal 10, subsum([1, 2, 3, 4])
    assert_equal 0, subsum([1, -2, -3, 4])
  end

  def test_two_parameters
    assert_equal 7, subsum([1, 2, 3, 4], 2)
    assert_equal 6, subsum([9, 8, 7, 6], 3)
  end

  def test_three_parameters
    assert_equal 24, subsum([9, 8, 7, 6], 0, 2)
    assert_equal 17, subsum([9, 8, 7, 6], 0, 1)
  end

  def test_nil
    assert_equal nil, subsum(nil)
  end

  def test_bad_second_parameter
    assert_equal nil, subsum([9, 8, 7, 6], 4)
  end

  def test_bad_third_parameter
    assert_equal nil, subsum([9, 8, 7, 6], 2, 1)
  end
end
