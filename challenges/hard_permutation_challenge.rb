require 'minitest/autorun'
require 'minitest/pride'

# Write a method which takes an array as a parameter and returns an array
# containing all permutations of that array.
#
# Do NOT use built-in methods for this.  Write it yourself.

# WRITE YOUR CODE HERE.  Name your method `all_permutations`.

class PermutationChallenge < MiniTest::Test
  def test_empty_array
    assert_equal [[]], all_permutations([])
  end

  def test_one_element_array
    assert_equal [["Dog"]], all_permutations(["Dog"])
  end

  def test_two_element_array
    assert_equal [[:potato, :ravioli], [:ravioli, :potato]], all_permutations([:potato, :ravioli])
  end

  def test_three_element_array
    results = all_permutations([1, 2, 3])
    assert_equal 6, results.length

    assert results.include?([1, 2, 3])
    assert results.include?([1, 3, 2])
    assert results.include?([2, 1, 3])
    assert results.include?([2, 3, 1])
    assert results.include?([3, 1, 2])
    assert results.include?([3, 2, 1])

    refute results.include?([1, 1, 1])
    refute results.include?([1])
    refute results.include?(1)
  end

  def test_five_element_array
    results = all_permutations([1, 2, 3, 4, 5])
    assert_equal 120, results.length

    assert results.include?([1, 2, 5, 4, 3])
    assert results.include?([1, 3, 5, 4, 2])
    assert results.include?([2, 1, 5, 4, 3])
    assert results.include?([2, 3, 5, 4, 1])
    assert results.include?([3, 1, 5, 4, 2])
    assert results.include?([3, 2, 5, 4, 1])

    refute results.include?([1, 1, 3, 4, 5])
    refute results.include?([5])
    refute results.include?(5)
  end
end
