gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './battleship'

$mock_inputs = []
class Game
  def get_user_input
    $mock_inputs.shift
  end
end

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

  def test_ships_know_if_they_overlap
    ship1 = Ship.new(4)
    ship1.place(2, 1, true)
    ship2 = Ship.new(4)
    ship2.place(3, 1, true)
    ship3 = Ship.new(4)
    ship3.place(2, 1, false)

    assert ship1.overlaps_with?(ship2)
    assert ship1.overlaps_with?(ship3)
    refute ship2.overlaps_with?(ship3)
  end

  def test_ships_can_be_fired_at
    ship = Ship.new(4)
    ship.place(2, 1, true)
    assert ship.fire_at(2, 1)
    refute ship.fire_at(1, 1)
  end

  def test_ships_can_be_sunk
    ship = Ship.new(2)
    ship.place(2, 1, true)
    refute ship.sunk?
    ship.fire_at(2, 1)
    refute ship.sunk?
    ship.fire_at(3, 1)
    assert ship.sunk?
  end


  def test_board_class_exists
    assert Board
  end

  def test_x_of
    board = Board.new
    assert_equal 1, board.x_of("A1")
    assert_equal 1, board.x_of("G1")
    assert_equal 6, board.x_of("D6")
    assert_equal 10, board.x_of("D10")
  end

  def test_y_of
    board = Board.new
    assert_equal 1, board.y_of("A1")
    assert_equal 7, board.y_of("G1")
    assert_equal 4, board.y_of("D6")
    assert_equal 4, board.y_of("D10")
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
    assert board.has_ship_on?("C4")
    assert board.has_ship_on?("C6")
    refute board.has_ship_on?("C7")
    refute board.has_ship_on?("D5")
  end

  def test_cant_place_overlapping_ships
    board = Board.new
    assert board.place_ship(Ship.new(4), "C3", true)
    refute board.place_ship(Ship.new(4), "C4", true)
    refute board.place_ship(Ship.new(4), "B4", false)
  end

  def test_misses_on_empty_board
    board = Board.new
    refute board.fire_at("A1")
    refute board.fire_at("G10")
  end

  def test_hits_on_board
    board = Board.new
    board.place_ship(Ship.new(4), "C3", true)
    refute board.fire_at("A1")
    assert board.fire_at("C3")
  end

  def test_repeat_miss
    board = Board.new
    board.place_ship(Ship.new(4), "C3", true)
    refute board.fire_at("A1")
    refute board.fire_at("A1")
  end

  def test_repeat_hit
    board = Board.new
    board.place_ship(Ship.new(4), "C3", true)
    assert board.fire_at("C3")
    refute board.fire_at("C3")
  end

  def test_misses_outside_board
    board = Board.new
    refute board.fire_at("A18")
    refute board.fire_at("Z10")
    refute board.fire_at("MONKEY")
  end

  def test_empty_board_can_display_itself
    board = Board.new
    assert_output(empty_board) do
      board.display
    end
  end

  def empty_board
    %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
  end

  def test_full_board_can_display_itself
    board = Board.new
    board.place_ship(Ship.new(2), "F3", true)
    board.place_ship(Ship.new(3), "D7", true)
    board.place_ship(Ship.new(3), "H4", true)
    board.place_ship(Ship.new(4), "A1", true)
    board.place_ship(Ship.new(5), "B6", false)
    assert_output(full_board) do
      board.display
    end
  end

  def full_board
    %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A | O | O | O | O |   |   |   |   |   |   |
B |   |   |   |   |   | O |   |   |   |   |
C |   |   |   |   |   | O |   |   |   |   |
D |   |   |   |   |   | O | O | O | O |   |
E |   |   |   |   |   | O |   |   |   |   |
F |   |   | O | O |   | O |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   | O | O | O |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
  end

  def test_used_board_can_display_itself
    board = Board.new
    board.place_ship(Ship.new(4), "D6", true)
    board.fire_at("D7")
    board.fire_at("E7")
    assert_output(used_board) do
      board.display
    end
  end

  def used_board
    %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   | O | X | O | O |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
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

  def test_game_class_exists
    assert Game
  end

  def test_games_require_players
    assert_raises(ArgumentError) do
      Game.new
    end
    human = HumanPlayer.new("Frank")
    computer = ComputerPlayer.new
    assert Game.new(human, computer)
  end

  def test_game_welcomes_player
    setup_new_game
    assert_output("Welcome, Frank and HAL 9000!\nIt's time to play Battleship.\n") do
      @game.welcome
    end
  end

  # def test_game_asks_human_to_place_ships
  #   setup_new_game
  #   assert_output("Frank, please place your ships.\n") do
  #     @game.place_ships(@human)
  #   end
  # end

  # def
  #   $mock_inputs << "exit"
  #   assert game.setup
  # end

  # def test_misses_on_empty_board
  #   board = Board.new
  #   assert_output("Firing on A1...\nMiss!\n") do
  #     refute board.fire_at("A1")
  #   end
  #   assert_output("Firing on G10...\nMiss!\n") do
  #     refute board.fire_at("G10")
  #   end
  # end

  def setup_new_game
    @human = HumanPlayer.new("Frank")
    @computer = ComputerPlayer.new
    @game = Game.new(@human, @computer)
  end
end
