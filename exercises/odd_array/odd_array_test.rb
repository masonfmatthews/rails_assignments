require 'minitest/autorun'
require 'minitest/pride'
require './odd_array'

class OddArrayTest < Minitest::Test

  #This is not good practice, AND it forces you to do dumb things like test_c_
  #  in the code.  However, it's easier to follow as you're learning if the
  #  tests always run in the same order.
  def self.test_order
    :alpha
  end

  def test_a_class_exists
    assert OddArray
  end

  def test_b_initializer_takes_array_parameter
    assert OddArray.new([1, 3, 5])
  end

  def test_c_to_a
    odd_array = OddArray.new([1, 3, 5])
    assert_equal [1, 3, 5], odd_array.to_a
  end

  def test_d_add_number
    odd_array = OddArray.new([1, 3, 5])
    odd_array.add(7)
    assert_equal [1, 3, 5, 7], odd_array.to_a
  end

  def test_e_initialize_with_evens
    odd_array = OddArray.new([1, 2, 3, 4, 5])
    assert_equal [1, 3, 5], odd_array.to_a
  end

  def test_f_add_evens
    odd_array = OddArray.new([1, 3, 5])
    odd_array.add(2)
    assert_equal [1, 3, 5], odd_array.to_a
  end

  def test_g_add_negatives
    odd_array = OddArray.new([-1, -2, 3, 4, -5])
    odd_array.add(-4)
    assert_equal [-1, 3, -5], odd_array.to_a
  end

  def test_h_add_decimals
    odd_array = OddArray.new([1, 3.2, 5])
    odd_array.add(2.1)
    assert_equal [1, 5], odd_array.to_a
  end

  def test_i_add_strings
    odd_array = OddArray.new([1, "Bob", 2])
    odd_array.add("Jen")
    assert_equal [1], odd_array.to_a
  end
end
