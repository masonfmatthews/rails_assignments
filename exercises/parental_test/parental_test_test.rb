gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './human_genome'

class ParentalTestTest < Minitest::Test

  def test_class_exists
    assert HumanGenome
  end

  def test_initializer_takes_array_parameter
    assert HumanGenome.new((1..46).to_a)
  end

  def test_to_a
    odd_array = OddArray.new([1, 3, 5])
    assert_equal odd_array.to_a, [1, 3, 5]
  end

  def test_add_number
    odd_array = OddArray.new([1, 3, 5])
    odd_array.add(7)
    assert_equal odd_array.to_a, [1, 3, 5, 7]
  end

  def test_initialize_with_evens
    odd_array = OddArray.new([1, 2, 3, 4, 5])
    assert_equal odd_array.to_a, [1, 3, 5]
  end

  def test_add_evens
    odd_array = OddArray.new([1, 3, 5])
    odd_array.add(2)
    assert_equal odd_array.to_a, [1, 3, 5]
  end

  def test_add_negatives
    odd_array = OddArray.new([-1, -2, 3, 4, -5])
    odd_array.add(-4)
    assert_equal odd_array.to_a, [-1, 3, -5]
  end

  def test_add_decimals
    odd_array = OddArray.new([1, 3.2, 5])
    odd_array.add(2.1)
    assert_equal odd_array.to_a, [1, 5]
  end

  def test_add_strings
    odd_array = OddArray.new([1, "Bob", 2])
    odd_array.add("Jen")
    assert_equal odd_array.to_a, [1]
  end
end
