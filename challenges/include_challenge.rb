require 'minitest/autorun'
require 'minitest/pride'

# Write code which will be included in the human class which will give humans
# intelligent and bipedal behavior.

# WRITE YOUR CODE BELOW THIS COMMENT...





# ...AND ABOVE THIS COMMENT.  DO NOT EDIT THE HUMAN CLASS BELOW.

class Human
  include Intelligent
  include Bipedal

  def initialize(name)
    @name = name
  end
end

class IncludeChallenge < MiniTest::Test

  def test_speaking
    assert_equal "My name is Zelda", Human.new("Zelda").say_name
    assert_equal "My name is Mary", Human.new("Mary").say_name
    assert_equal "My name is Amanda", Human.new("Amanda").say_name
  end

  def test_running
    assert_equal "Huff puff huff puff", Human.new("Zelda").run
    assert_equal "Huff puff huff puff", Human.new("Mary").run
  end

  def test_constants
    assert_equal 2, Human::NUMBER_OF_LEGS
    assert_equal 1, Human::NUMBER_OF_BRAINS
  end

  def test_methods_like_constants
    human = Human.new("Zelda")
    assert_equal 2, human.number_of_legs
    assert_equal 1, human.number_of_brains
  end

end
