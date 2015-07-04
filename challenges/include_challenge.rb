require 'minitest/autorun'
require 'minitest/pride'

# Write modules which will be included in the classes below which will give
# intelligent and bipedal behavior.
#
# You may not write any methods in the existing classes, but you may write
# `include` statements in them.

class Human
  def initialize(name)
    @name = name
  end
end

class Ai
  def initialize(name, version)
    @name = name
    @version = version
  end
end

class Ostrich
  def initialize(height)
    @height = height
  end
end

class IncludeChallenge < MiniTest::Test

  def test_speaking
    assert_equal "My name is Zelda", Human.new("Zelda").say_name
    assert_equal "My name is Mary", Human.new("Mary").say_name
    assert_equal "My name is Watson", Ai.new("Watson", 1.1).say_name
    assert_equal "My name is HAL", Ai.new("HAL", 2000).say_name
    assert_raises(NoMethodError) {Ostrich.new(40).say_name}
  end

  def test_running
    assert_equal "Huff puff huff puff", Human.new("Alice").run
    assert_equal "Huff puff huff puff", Ostrich.new(48.5).run
    assert_raises(NoMethodError) {Ai.new("Skynet", 3.0).run}
  end

  # So... humor me for a moment and pretend like ostriches don't have brains.
  def test_constants
    assert_equal 2, Human::NUMBER_OF_LEGS
    assert_equal 1, Human::NUMBER_OF_BRAINS
    assert_equal 2, Ostrich::NUMBER_OF_LEGS
    assert_equal 1, Ai::NUMBER_OF_BRAINS
  end

  # Again... ostriches get no brains.  My apologies to all ostriches out there.
  def test_methods_like_constants
    human = Human.new("Cathy")
    assert_equal 2, human.number_of_legs
    assert_equal 1, human.number_of_brains
    ai = Ai.new("Master Control Program", 1.0)
    assert_equal 1, ai.number_of_brains
    assert_raises(NoMethodError) {ai.number_of_legs}
  end

end
