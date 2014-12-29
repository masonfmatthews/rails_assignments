gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './battleship'

class BattleshipTest < Minitest::Test

  #This is not good practice, AND it forces you to do dumb things like test_c_
  #  in the code.  However, it's easier to follow as you're learning if the
  #  tests always run in the same order.
  def self.test_order
    :alpha
  end

  def test_01_classes_exists
    assert Ship
    assert Board
    assert Player
    #...
  end

  def test_ship_behavior
    
  end
end
