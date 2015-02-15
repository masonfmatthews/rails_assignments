require 'minitest/autorun'
require 'minitest/pride'

# Write a method which returns:
#
#   * "Fizz" if the number is divisible by 3
#   * "Buzz" if the number is divisible by 5
#   * "FizzBuzz" if the number is divisible by 3 and 5
#   * Otherwise, return the number itself
#
# Remember that the % operator (modulo) is your friend.  It returns a zero if one
# number is divisible by another number.  In other words, 4 % 2 == 0.

# WRITE YOUR CODE HERE.  Name your method `fizzbuzz`.

class IfChallenge < MiniTest::Test
  def test_one
    assert_equal 1, fizzbuzz(1)
  end

  def test_three
    assert_equal "Fizz", fizzbuzz(3)
  end

  def test_five
    assert_equal "Buzz", fizzbuzz(5)
  end

  def test_eight
    assert_equal 8, fizzbuzz(8)
  end

  def test_ten
    assert_equal "Buzz", fizzbuzz(10)
  end

  def test_fifteen
    assert_equal "FizzBuzz", fizzbuzz(15)
  end

  def test_twenty_three
    assert_equal 23, fizzbuzz(23)
  end

  def test_thirty
    assert_equal "FizzBuzz", fizzbuzz(30)
  end
end
