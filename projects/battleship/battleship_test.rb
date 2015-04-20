require 'minitest/autorun'
require 'minitest/pride'

#Note: This line is going to fail first.
require './battleship.rb'

$mock_inputs = []
def get_user_input
  $mock_inputs.shift
end

class BattleshipTest < Minitest::Test

  #This self.test_order methidis not good practice, AND it forces you to write
  #   dumb things like test_00_ in the code.  However,
  #   it's easier to follow as you're learning if the
  #   tests always run in the same order.  Sorry.
  def self.test_order
    :alpha
  end

  def test_01_player_classes_exist
    assert Player
    assert HumanPlayer
    assert ComputerPlayer
  end

  def test_02_players_have_inheritance
    assert_equal Player, HumanPlayer.superclass
    assert_equal Player, ComputerPlayer.superclass
  end

  def test_03_humans_can_be_named
    assert_equal "Alice", HumanPlayer.new("Alice").name
  end

  def test_04_computers_cannot_be_named
    assert_raises(ArgumentError) do
      ComputerPlayer.new("The Red Queen")
    end
  end

  def test_05_players_have_default_names
    assert_equal "Dave", HumanPlayer.new.name
    assert_equal "HAL 9000", ComputerPlayer.new.name
  end

  def test_06_ship_class_exists
    assert Ship
  end

  def test_07_ship_knows_its_length
    ship = Ship.new(4)
    assert_equal 4, ship.length
  end

  def test_08_ship_can_be_placed_across
    ship = Ship.new(4)
    assert ship.place(2, 1, true)

    assert ship.covers?(2, 1)
    assert ship.covers?(3, 1)
    assert ship.covers?(4, 1)
    assert ship.covers?(5, 1)

    refute ship.covers?(1, 1)
    refute ship.covers?(6, 1)
    refute ship.covers?(4, 2)
  end

  def test_09_ship_can_be_placed_down
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

  def test_10_ship_cant_be_placed_twice
    ship = Ship.new(4)
    assert ship.place(2, 1, true)
    refute ship.place(3, 2, false)
  end

  def test_11_ships_know_if_they_overlap
    ship1 = Ship.new(4)
    ship1.place(2, 1, true)
    ship2 = Ship.new(4)
    ship2.place(3, 1, true)
    ship3 = Ship.new(4)
    ship3.place(2, 1, false)

    # Try to use your `covers?` method inside your `overlaps_with?` code.
    assert ship1.overlaps_with?(ship2)
    assert ship1.overlaps_with?(ship3)
    refute ship2.overlaps_with?(ship3)
  end

  def test_12_ships_can_be_fired_at
    ship = Ship.new(4)
    ship.place(2, 1, true)

    assert ship.fire_at(2, 1)
    refute ship.fire_at(1, 1)
  end

  def test_13_ships_can_be_sunk
    ship = Ship.new(2)
    ship.place(2, 1, true)

    refute ship.sunk?
    ship.fire_at(2, 1)
    refute ship.sunk?
    ship.fire_at(3, 1)
    assert ship.sunk?
  end

  # Around here, you're going to get frustrated if you have been keeping an
  # array of positions like [[1, 1], [2, 1], [3,1]].  Consider making this an
  # array of Position objects instead.  Then you can add other fields besides x
  # and y.  For instance, you can write a method `hit?` on Position.

  def test_14_unplaced_ship_is_not_sunk
    ship = Ship.new(2)
    refute ship.sunk?
  end

  # One last note before we move onto the board.  The best solution to the above
  # tests would be to use `covers?` inside `fire_at`.  For this to be really
  # slick, though, you'll want `covers?` to not just return a true or a false.
  # Make it wicked cool by having it return the specific position object
  # that was being fired on.  Then you can immediately mark it as hit without
  # searching for it again.

  def test_15_board_class_exists
    assert Board
  end

  def test_16_empty_board
    board = Board.new
    refute board.has_ship_on?(1, 1)
    refute board.has_ship_on?(10, 7)
  end

  def test_17_place_ship
    board = Board.new
    assert board.place_ship(Ship.new(4), 3, 3, true)
    refute board.has_ship_on?(2, 3)
    assert board.has_ship_on?(3, 3)
    assert board.has_ship_on?(4, 3)
    assert board.has_ship_on?(6, 3)
    refute board.has_ship_on?(7, 3)
    refute board.has_ship_on?(5, 4)
  end

  def test_18_cant_place_overlapping_ships
    board = Board.new
    assert board.place_ship(Ship.new(4), 3, 3, true)
    refute board.place_ship(Ship.new(4), 1, 3, true)
    refute board.place_ship(Ship.new(4), 4, 3, true)
    refute board.place_ship(Ship.new(4), 4, 2, false)
    assert board.place_ship(Ship.new(4), 7, 7, true)
  end

  def test_20_misses_on_empty_board
    board = Board.new
    refute board.fire_at(1, 1)
    refute board.fire_at(10, 7)
  end

  def test_20_hits_on_board
    board = Board.new
    board.place_ship(Ship.new(4), 3, 3, true)
    refute board.fire_at(1, 1)
    assert board.fire_at(3, 3)
  end

  def test_20_repeat_miss
    board = Board.new
    board.place_ship(Ship.new(4), 3, 3, true)
    refute board.fire_at(1, 1)
    refute board.fire_at(1, 1)
  end

  def test_20_repeat_hit
    board = Board.new
    board.place_ship(Ship.new(4), 3, 3, true)
    assert board.fire_at(3, 3)
    refute board.fire_at(3, 3)
  end

  def test_20_misses_outside_board
    board = Board.new
    refute board.fire_at(18, 1)
    refute board.fire_at(10, 26)
  end

  def test_20_empty_board_can_display_itself
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

  def test_20_full_board_can_display_itself
    board = Board.new
    board.place_ship(Ship.new(2), 3, 6, true)
    board.place_ship(Ship.new(3), 7, 4, true)
    board.place_ship(Ship.new(3), 4, 8, true)
    board.place_ship(Ship.new(4), 1, 1, true)
    board.place_ship(Ship.new(5), 6, 2, false)
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

  def test_20_used_board_can_display_itself
    board = Board.new
    board.place_ship(Ship.new(4), 6, 4, true)
    board.fire_at(7, 4)
    board.fire_at(7, 5)
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

  def test_20_entire_board_can_be_sunk
    board = Board.new
    refute board.sunk?
    board.place_ship(Ship.new(2), 6, 4, true)
    refute board.sunk?
    board.fire_at(6, 4)
    refute board.sunk?
    board.fire_at(7, 4)
    assert board.sunk?
  end







  def test_26_players_have_boards
    assert_equal Board, HumanPlayer.new.board.class
    assert_equal Board, ComputerPlayer.new.board.class
  end

  def test_27_computer_player_automatically_places_ships
    player = ComputerPlayer.new
    assert_output("HAL 9000 has placed his ships.\n") do
      assert player.place_ships([2, 3, 3, 4, 5])
    end
    assert_equal 5, player.ships.length
    assert_equal 4, player.ships[3].length
  end


  def test_28_x_of
    board = Board.new
    assert_equal 1, board.x_of("A1")
    assert_equal 1, board.x_of("G1")
    assert_equal 6, board.x_of("D6")
    assert_equal 10, board.x_of("D10")
  end

  def test_29_y_of
    board = Board.new
    assert_equal 1, board.y_of("A1")
    assert_equal 7, board.y_of("G1")
    assert_equal 4, board.y_of("D6")
    assert_equal 4, board.y_of("D10")
  end

  def test_30_human_player_is_asked_to_place_ships
    player = HumanPlayer.new
    $mock_inputs.clear
    $mock_inputs << "A1"
    $mock_inputs << "Down"
    $mock_inputs << "A4"
    $mock_inputs << "Down"
    assert_output("Dave, where would you like to place a ship of length 2?\nAcross or Down?\n"+
                  "Dave, where would you like to place a ship of length 5?\nAcross or Down?\n") do
      assert player.place_ships([2, 5])
    end
    assert_equal 2, player.ships.length
    assert_equal 5, player.ships[1].length
    assert player.board.has_ship_on?(1, 1)
    assert player.board.has_ship_on?(4, 1)
    assert player.board.has_ship_on?(1, 2)
    refute player.board.has_ship_on?(1, 3)
  end



  def test_31_game_class_exists
    assert Game
  end

  def test_32_games_require_players
    assert_raises(ArgumentError) do
      Game.new
    end
    human = HumanPlayer.new("Frank")
    computer = ComputerPlayer.new
    assert Game.new(human, computer)
  end

  def test_33_game_welcomes_player
    human = HumanPlayer.new("Frank")
    computer = ComputerPlayer.new
    game = Game.new(human, computer)
    assert_output("Welcome, Frank and HAL 9000!\nIt's time to play Battleship.\n") do
      game.welcome
    end
  end

  def test_34_game_can_ask_to_set_up_ships
    set_up_new_game

    assert_equal 5, @human.ships.length
    assert @human.board.has_ship_on?(1, 2)
    assert @human.board.has_ship_on?(3, 3)
    assert @human.board.has_ship_on?(9, 5)
    refute @human.board.has_ship_on?(7, 7)

    assert_equal 5, @computer.ships.length
    assert_equal 4, @computer.ships[3].length
  end

  def set_up_new_game
    @human = HumanPlayer.new("Frank")
    @computer = ComputerPlayer.new
    @game = Game.new(@human, @computer)
    $mock_inputs.clear
    $mock_inputs << "A1"
    $mock_inputs << "Down"
    $mock_inputs << "A3"
    $mock_inputs << "Down"
    $mock_inputs << "A5"
    $mock_inputs << "Down"
    $mock_inputs << "A7"
    $mock_inputs << "Down"
    $mock_inputs << "A9"
    $mock_inputs << "Down"
    assert_output("Frank, where would you like to place a ship of length 2?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 4?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 5?\nAcross or Down?\n"+
                  "HAL 9000 has placed his ships.\n") do
      @game.place_ships
    end
  end

  def test_35_game_can_have_nonstandard_set_of_ships
    human = HumanPlayer.new("Alice")
    computer = ComputerPlayer.new
    game = Game.new(human, computer, [2, 3])
    $mock_inputs.clear
    $mock_inputs << "A1"
    $mock_inputs << "Down"
    $mock_inputs << "A3"
    $mock_inputs << "Down"
    assert_output("Alice, where would you like to place a ship of length 2?\nAcross or Down?\n"+
                  "Alice, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "HAL 9000 has placed his ships.\n") do
      game.place_ships
    end
  end

  def test_36_game_tells_you_if_your_ships_overlap
    human = HumanPlayer.new("Alice")
    computer = ComputerPlayer.new
    game = Game.new(human, computer, [2, 3])
    $mock_inputs.clear
    $mock_inputs << "A2"
    $mock_inputs << "Down"
    $mock_inputs << "A1"
    $mock_inputs << "Across"
    $mock_inputs << "F1"
    $mock_inputs << "Across"
    assert_output("Alice, where would you like to place a ship of length 2?\nAcross or Down?\n"+
                  "Alice, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "Unfortunately, that ship overlaps with one of your other ships.  Please try again.\n"+
                  "Alice, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "HAL 9000 has placed his ships.\n") do
      game.place_ships
    end
  end

  def test_37_human_can_take_first_turn
    set_up_new_game
    $mock_inputs.clear
    $mock_inputs << "A1"

    # This /(Miss!|Hit!)/ thing just checks to see if Miss! or Hit! was included anywhere in the message.
    assert_output(/(Miss!|Hit!)/) do
      @game.take_turn
    end
  end

  def test_38_computer_can_take_second_turn
    set_up_new_game
    $mock_inputs.clear
    $mock_inputs << "A1"
    assert_output(/(Miss!|Hit!)/) do
      @game.take_turn
    end
    assert_output(/(Miss!|Hit!)/) do
      @game.take_turn
    end
  end

  def test_39_display_game_status
    set_up_new_game
    assert_output(starting_game_status) do
      @human.display_game_status
    end
  end

  def starting_game_status
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

    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A | O |   | O |   | O |   | O |   | O |   |
B | O |   | O |   | O |   | O |   | O |   |
C |   |   | O |   | O |   | O |   | O |   |
D |   |   |   |   |   |   | O |   | O |   |
E |   |   |   |   |   |   |   |   | O |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}
  end

  def test_40_game_status_shows_hits_and_misses
    human1 = HumanPlayer.new("Amy")
    human2 = HumanPlayer.new("Beth")
    game = Game.new(human1, human2, [2])
    $mock_inputs.clear

    # It doesn't matter what messages come up during the turns
    assert_output(/./) do
      $mock_inputs << "A2"     #Amy's ship's location
      $mock_inputs << "Down"   #Amy's ship's direction

      $mock_inputs << "F3"     #Beth's ship's location
      $mock_inputs << "Across" #Beth's ship's direction
      game.place_ships

      $mock_inputs << "F3"     #Amy's hit
      game.take_turn

      $mock_inputs << "A2"     #Beth's hit
      game.take_turn

      $mock_inputs << "H4"     #Amy's miss
      game.take_turn

      $mock_inputs << "A2"     #Beth's miss (she shot in the same spot as last time)
      game.take_turn
    end

    # Now the visuals matter.  Should show Amy's shots up top and Amy's own ship below.
    assert_output(mid_game_status) do
      human1.display_game_status
    end
  end

  def mid_game_status
    %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   | + |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   | - |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------

    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   | X |   |   |   |   |   |   |   |   |
B |   | O |   |   |   |   |   |   |   |   |
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

  def test_41_game_can_be_won
    human1 = HumanPlayer.new("Amy")
    human2 = HumanPlayer.new("Beth")
    game = Game.new(human1, human2, [2])
    $mock_inputs.clear
    $mock_inputs << "A2"     #Amy's ship's location
    $mock_inputs << "Down"   #Amy's ship's direction

    $mock_inputs << "F3"     #Beth's ship's location
    $mock_inputs << "Across" #Beth's ship's direction

    $mock_inputs << "F3"     #Amy's first shot
    $mock_inputs << "A1"     #Beth's first shot
    $mock_inputs << "F4"     #Amy's winning shot

    assert_output(/Congratulations, Amy!/) do
      game.play  #When Amy wins, it has to say 'Congratulations, Amy' somewhere in the victory message.
    end
  end
end
