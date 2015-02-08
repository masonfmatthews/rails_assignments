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

class IfQuiz < MiniTest::Test
  def test_one
    assert_equal fizzbuzz(1), 1
  end

  def test_three
    assert_equal fizzbuzz(3), "Fizz"
  end

  def test_five
    assert_equal fizzbuzz(5), "Buzz"
  end

  def test_eight
    assert_equal fizzbuzz(8), 8
  end

  def test_ten
    assert_equal fizzbuzz(10), "Buzz"
  end

  def test_fifteen
    assert_equal fizzbuzz(15), "FizzBuzz"
  end

  def test_twenty_three
    assert_equal fizzbuzz(23), 23
  end

  def test_thirty
    assert_equal fizzbuzz(30), "FizzBuzz"
  end
end
