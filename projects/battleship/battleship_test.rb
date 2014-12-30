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

  def test_ship_class_exists
    assert Ship
  end

  def test_ship_knows_its_length
    ship = Ship.new(4)
    assert_equal 4, ship.length
  end

  def test_ship_can_be_placed_across
    ship = Ship.new(4)
    assert ship.place(2, 1, true)
    refute ship.covers?(1, 1)
    assert ship.covers?(2, 1)
    assert ship.covers?(3, 1)
    assert ship.covers?(4, 1)
    assert ship.covers?(5, 1)
    refute ship.covers?(6, 1)
    refute ship.covers?(4, 2)
  end

  def test_ship_can_be_placed_down
    ship = Ship.new(4)
    assert ship.place(2, 2, false)
    refute ship.covers?(2, 1)
    assert ship.covers?(2, 2)
    assert ship.covers?(2, 3)
    assert ship.covers?(2, 4)
    assert ship.covers?(2, 5)
    refute ship.covers?(2, 6)
    refute ship.covers?(3, 2)
  end

  def test_ship_cant_be_placed_twice
    ship = Ship.new(4)
    assert ship.place(2, 1, true)
    refute ship.place(3, 2, false)
  end

  def test_board_class_exists
    assert Board
  end

  def test_x_coordinate
    board = Board.new
    assert_equal 1, board.x_coordinate("A1")
    assert_equal 1, board.x_coordinate("G1")
    assert_equal 6, board.x_coordinate("D6")
    assert_equal 10, board.x_coordinate("D10")
  end

  def test_y_coordinate
    board = Board.new
    assert_equal 1, board.y_coordinate("A1")
    assert_equal 7, board.y_coordinate("G1")
    assert_equal 4, board.y_coordinate("D6")
    assert_equal 4, board.y_coordinate("D10")
  end

  def test_empty_board
    board = Board.new
    refute board.has_ship_on?("A1")
    refute board.has_ship_on?("G10")
  end

  def test_place_ship
    board = Board.new
    assert board.place_ship(Ship.new(4), "C3", true)
    refute board.has_ship_on?("C2")
    assert board.has_ship_on?("C3")
    assert board.has_ship_on?("C6")
    refute board.has_ship_on?("C7")
    refute board.has_ship_on?("D5")
  end

  def test_misses_on_empty_board
    board = Board.new
    assert_output("Miss!\n") do
      refute board.fire_at("A1")
    end
    assert_output("Miss!\n") do
      refute board.fire_at("G10")
    end
  end

  def test_hits_on_board
    #TODO!!!
  end

  def test_misses_outside_board
    board = Board.new
    assert_output("Miss!\n") do
      refute board.fire_at("A18")
    end
    assert_output("Miss!\n") do
      refute board.fire_at("Z10")
    end
    assert_output("Miss!\n") do
      refute board.fire_at("MONKEY")
    end
  end

  def test_player_classes_exist
    assert Player
    assert HumanPlayer
    assert ComputerPlayer
  end

  def test_players_have_inheritance
    assert_equal Player, HumanPlayer.superclass
    assert_equal Player, ComputerPlayer.superclass
  end

  def test_humans_can_be_named
    assert_equal "Alice", HumanPlayer.new("Alice").name
  end

  def test_computers_cannot_be_named
    assert_raises(ArgumentError) do
      ComputerPlayer.new("The Red Queen")
    end
  end

  def test_players_have_default_names
    assert_equal "Dave", HumanPlayer.new.name
    assert_equal "HAL 9000", ComputerPlayer.new.name
  end

  def test_games_require_players
    assert_raises(ArgumentError) do
      Game.new
    end
    human = HumanPlayer.new("Frank")
    computer = ComputerPlayer.new
    assert Game.new(human, computer)
  end

  def test_game_can
    human = HumanPlayer.new("Frank")
    computer = ComputerPlayer.new
    assert Game.new(human, computer)
  end
end
