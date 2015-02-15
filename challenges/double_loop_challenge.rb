require 'minitest/autorun'
require 'minitest/pride'

# Write a method which accepts an array as the first paramater and a number
# as the second parameter.  Return true if two of the numbers in the array sum
# to the second parameter.

# WRITE YOUR CODE HERE.  Name your method `complements?`.


class DoubleLoopChallenge < MiniTest::Test

  def test_exact_match_arrays
    assert complements?([1, 0], 1)
    assert complements?([-4, 4], 0)
    assert complements?([25, 43], 68)
    refute complements?([25, 25], 25)
    refute complements?([1, 3], 25)
    refute complements?([-25, 25], 25)
  end

  def test_too_small_arrays
    refute complements?([25], 25)
    refute complements?([], 25)
    refute complements?(nil, 25)
  end

  def test_bigger_arrays
    assert complements?([1, 0, 2, 17, 8], 1)
    assert complements?([24, 78, 0, -4, 4], 0)
    assert complements?([1, 25, 3, 8, -8, 43], 68)
    refute complements?([18, 25, 43, 25, 98, 10], 25)
    refute complements?([12, 2, 3, 9, 11], 25)
    refute complements?([25, -25, 25, -25, 25], 25)
  end

  def test_double_counting
    refute complements?([12, 0], 24)
    refute complements?([50, -10], 100)
  end
end
