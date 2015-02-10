require 'minitest/autorun'
require 'minitest/pride'

# Write a method which accepts one parameter.  The method should return true if
# the string passed to it is a palindrome.  It should return false if the string
# is not a palindrome

# WRITE YOUR CODE HERE.

class StringPrimeQuiz < MiniTest::Test
  def test_words
    assert palindrome?("tacocat")
    assert palindrome?("anna")
    assert palindrome?("racecar")
  end

  def test_bad_words
    refute palindrome?("ruby")
    refute palindrome?("cowboy")
    refute palindrome?("Ruby")
    refute palindrome?("Cowboy")
  end

  def test_capitalization
    assert palindrome?("Tacocat")
    assert palindrome?("Anna")
    assert palindrome?("RacEcAr")
  end

  def test_sentences
    assert palindrome?("Stressed desserts")
    assert palindrome?("Stop on no pots")
    refute palindrome?("The quick brown fox")
  end

  def test_spaces
    assert palindrome?("Mad as Adam")
    assert palindrome?("Sums are not set as a test on Erasmus")
    refute palindrome?("Where the heck did you get these sentences?")
  end
end
