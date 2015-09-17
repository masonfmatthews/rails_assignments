require 'minitest/autorun'
require 'minitest/pride'

# Write two methods:
#
#   * `first_name`: given a name in string, return the first name.
#   * `last_name`: given a name in string, return the last name.

# WRITE YOUR CODE HERE.

class StringSplitChallenge < MiniTest::Test
  def test_first_name
    assert_equal "Mason", first_name("Mason Matthews")
  end

  def test_last_name
    assert_equal "Matthews", last_name("Mason Matthews")
  end

  def test_one_word_name
    assert_equal "deadmou5", first_name("deadmou5")
    assert_equal "", last_name("deadmou5")
  end

  def test_three_word_name
    assert_equal "John Quincy", first_name("John Quincy Adams")
    assert_equal "Adams", last_name("John Quincy Adams")
  end

  def test_no_word_name
    assert_equal "", first_name("")
    assert_equal "", last_name("")
  end
end
