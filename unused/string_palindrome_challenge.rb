require 'minitest/autorun'
require 'minitest/pride'

# Write a method which accepts one parameter.  The method should return true if
# the string passed to it is a palindrome.  It should return false if the string
# is not a palindrome

# WRITE YOUR CODE HERE.

class StringPalindromeChallenge < MiniTest::Test
  def test_words
    assert palindrome?("tacocat")
    assert palindrome?("anna")
    assert palindrome?("racecar")
    refute palindrome?("ruby")
    refute palindrome?("cowboy")
  end

  def test_capitalization
    assert palindrome?("Tacocat")
    assert palindrome?("Anna")
    assert palindrome?("RacEcAr")
    refute palindrome?("Ruby")
    refute palindrome?("Cowboy")
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

  def test_punctuation
    assert palindrome?("A car, a man, a maraca.")
    assert palindrome?("Satan, oscillate my metallic sonatas!")
    assert palindrome?("Pull up; Eva, we’re here! Wave! Pull up!")
    refute palindrome?("Wait! Don't drive off that cliff!")
  end
end
