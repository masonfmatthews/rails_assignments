require 'minitest/autorun'
require 'minitest/pride'

# Write a series of methods which use the .any, .all, .map, .select, .reject, and
# .reduce methods in Enumerable.  Each of your methods should be one line.

# WRITE YOUR CODE HERE.  In this challenge, names longer than 5 characters are
# considered long.


class EnumerableChallenge < MiniTest::Test

  def test_any
    assert has_even?([2, 3, 4, 5, 6])
    assert has_even?([-2, 3, -4, 5, -6])
    refute has_even?([3, 5])
    refute has_even?([-3, -5])
  end

  def test_all
    assert all_short?(["Amy", "Bob", "Cam"])
    assert all_short?(["Zeke", "Yoo", "Xod"])
    refute all_short?(["Amy", "Bob", "Cammie"])
    refute all_short?(["Zachary", "Yoo", "Xod"])
  end

  def test_map
    assert_equal [1, 4, 9], squares([1, 2, 3])
    assert_equal [16, 36, 81], squares([4, 6, 9])
  end

  def test_select
    assert_equal ["Amy", "Bob", "Cam"], just_short(["Amy", "Bob", "Cam"])
    assert_equal ["Zeke", "Yoo", "Xod"], just_short(["Zeke", "Yoo", "Xod"])
    assert_equal ["Amy", "Bob"], just_short(["Amy", "Bob", "Cammie"])
    assert_equal ["Yoo", "Xod"], just_short(["Zachary", "Yoo", "Xod"])
  end

  def test_reject
    assert_equal ["Amy", "Bob", "Cam"], no_long(["Amy", "Bob", "Cam"])
    assert_equal ["Zeke", "Yoo", "Xod"], no_long(["Zeke", "Yoo", "Xod"])
    assert_equal ["Amy", "Bob"], no_long(["Amy", "Bob", "Cammie"])
    assert_equal ["Yoo", "Xod"], no_long(["Zachary", "Yoo", "Xod"])
  end

  def test_reduce
    assert_equal 1, product([1, 1, 1])
    assert_equal 150, product([3, 5, 10])
    assert_equal 0, product([18, 13, 0])
    assert_equal 12, product([2, 3, 2])
  end
end
