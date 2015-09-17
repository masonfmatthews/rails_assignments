require 'minitest/autorun'
require 'minitest/pride'

def first_name(name)
  array = name.to_s.split
  return name.to_s if array.length < 2
  array[0..-2].join(" ")
end

def last_name(name)
  array = name.to_s.split
  return "" if array.length < 2
  array[-1]
end

# Write a method which accepts an array and returns a hash.  Each item in the
# array will be a string, and the returned hash should have last names as keys
# and first names as values.

# WRITE YOUR CODE HERE.  Name your method `names`.  Use the above `first_name` and
# `last_name` methods INSIDE your new `names` method.

class ArrayAndHashChallenge < MiniTest::Test

  def test_normal_name
    expected = {"Adams" => "John Quincy"}
    assert_equal expected, names("John Quincy Adams")
  end

  def test_complex_name
    expected = {"Adams" => "John Quincy"}
    assert_equal expected, names("John Quincy Adams")
  end

  def test_short_name
    expected = {"" => "deadmou5"}
    assert_equal expected, names("deadmou5")
  end

  def test_one_name_in_array
    expected = {"Washington" => "George"}
    assert_equal expected, names(["George Washington"])
  end

  def test_two_names
    expected = {"Washington" => "George", "Adams" => "John Quincy"}
    assert_equal expected, names(["George Washington", "John Quincy Adams"])
  end

  def test_no_names
    assert_equal Hash.new, names(Array.new)
  end

  def test_nil
    assert_equal Hash.new, names(nil)
  end

  # # Hard mode
  # # This test goes above and beyond the call of duty.  Only uncomment it and
  # # worry about making it pass if you have extra time.
  # def test_last_names_dont_overwrite
  #   expected = {"Washington" => "George", "Roosevelt" => ["Theodore", "Franklin"]}
  #   assert_equal expected, names(["George Washington", "Theodore Roosevelt", "Franklin Roosevelt"])
  # end
end
