require 'minitest/autorun'
require 'minitest/pride'

#Note: This line is going to fail first.
require './battleship.rb'

$mock_inputs = []
def get_user_input
  $mock_inputs.shift
end

class BattleshipTest < Minitest::Test

  #This self.test_order method is not good practice, AND it forces you to write
  #   dumb things like test_00_ in the code.  However, it's easier to follow as
  #   you're learning if the tests always run in the same order.  Sorry.
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
    assert_equal "Bob", HumanPlayer.new("Bob").name
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
    refute ship.place(3, 2, true)
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
    refute ship.fire_at(2, 1)
  end

  def test_13_ships_can_be_sunk
    ship = Ship.new(2)
    ship.place(2, 1, true)

    refute ship.sunk?
    ship.fire_at(2, 1)
    refute ship.sunk?
    ship.fire_at(3, 1)
    assert ship.sunk?
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

  # One last note before we move onto the grid.  The best solution to the above
  # tests would be to use `covers?` inside `fire_at`.  For this to be really
  # slick, though, you'll want `covers?` to not just return a true or a false.
  # Make it wicked cool by having it return the specific position object
  # that was being fired on.  Then you can immediately mark it as hit without
  # searching for it again.

  def test_15_grid_class_exists
    assert Grid
  end

  # Remember, for a moment, just solve this one in the simplest way possible. As
  # far as this test is concerned, what does `has_ship_on?` always return?
  def test_16_empty_grid
    grid = Grid.new
    refute grid.has_ship_on?(1, 1)
    refute grid.has_ship_on?(10, 7)
  end

  def test_17_empty_grid_can_display_itself
    grid = Grid.new
    assert_output(empty_grid) do
      grid.display
    end
  end

  def empty_grid
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

  def test_18_place_ship
    grid = Grid.new
    assert grid.place_ship(Ship.new(4), 3, 3, true)
    refute grid.has_ship_on?(2, 3)
    assert grid.has_ship_on?(3, 3)
    assert grid.has_ship_on?(4, 3)
    assert grid.has_ship_on?(6, 3)
    refute grid.has_ship_on?(7, 3)
    refute grid.has_ship_on?(5, 4)
  end

  # Don't forget on this next one that giving the ship coordinates and placing
  # it on the grid are two separate steps.  You can do the first before knowing
  # whether it's possible to do the second.
  def test_19_cant_place_overlapping_ships
    grid = Grid.new
    assert grid.place_ship(Ship.new(4), 3, 3, true)
    refute grid.place_ship(Ship.new(4), 1, 3, true)
    refute grid.place_ship(Ship.new(4), 4, 3, true)
    refute grid.place_ship(Ship.new(4), 4, 2, false)
    assert grid.place_ship(Ship.new(4), 7, 7, true)
  end

  def test_20_ready_grid_can_display_itself
    grid = Grid.new
    assert grid.place_ship(Ship.new(2), 3, 6, true)
    assert grid.place_ship(Ship.new(3), 7, 4, true)
    assert grid.place_ship(Ship.new(3), 4, 8, true)
    assert grid.place_ship(Ship.new(4), 1, 1, true)
    assert grid.place_ship(Ship.new(5), 6, 2, false)
    assert_output(ready_grid) do
      grid.display
    end
  end

  def ready_grid
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

  def test_21_misses_on_empty_grid
    grid = Grid.new
    refute grid.fire_at(1, 1)
    refute grid.fire_at(10, 7)
  end

  def test_22_misses_outside_grid
    grid = Grid.new
    refute grid.fire_at(18, 1)
    refute grid.fire_at(10, 26)
  end

  def test_23_hits_on_grid
    grid = Grid.new
    grid.place_ship(Ship.new(4), 3, 3, true)
    refute grid.fire_at(1, 1)
    assert grid.fire_at(3, 3)
  end

  # Depending on how you implemented prior steps, this next one might
  # be a big refactor.  You might have to change grid.fire_at, ship.fire_at,
  # and a position method (if you made a Position class).
  def test_24_repeat_hit
    grid = Grid.new
    grid.place_ship(Ship.new(4), 3, 3, true)
    assert grid.fire_at(3, 3)
    refute grid.fire_at(3, 3)
  end

  # The test before this one needed to set a position as hit.  This tests need
  # to do the opposite: see if positions are hit.
  def test_25_used_grid_can_display_itself
    grid = Grid.new
    grid.place_ship(Ship.new(4), 6, 4, true)
    assert grid.fire_at(7, 4)
    refute grid.fire_at(7, 5)
    assert_output(used_grid) do
      grid.display
    end
  end

  def used_grid
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

  def test_26_entire_grid_can_be_sunk
    grid = Grid.new
    refute grid.sunk?
    grid.place_ship(Ship.new(2), 6, 4, true)
    refute grid.sunk?
    grid.fire_at(6, 4)
    refute grid.sunk?
    grid.fire_at(7, 4)
    assert grid.sunk?
  end

  def test_27_x_of
    grid = Grid.new
    assert_equal 1, grid.x_of("A1")
    assert_equal 1, grid.x_of("G1")
    assert_equal 6, grid.x_of("D6")
    assert_equal 10, grid.x_of("D10")
  end

  def test_28_y_of
    grid = Grid.new
    assert_equal 1, grid.y_of("A1")
    assert_equal 7, grid.y_of("G1")
    assert_equal 4, grid.y_of("D6")
    assert_equal 4, grid.y_of("D10")
  end

  def test_29_players_have_grids
    assert_equal Grid, HumanPlayer.new.grid.class
    assert_equal Grid, ComputerPlayer.new.grid.class
  end

  # Finally, we ask the user for input.  When the human player places ships,
  # the only parameter is an array with the lengths of the ships that need to be
  # placed.  The user is asked two things for each ship.  First, what is the
  # starting coordinate of that ship, and second, which direction (down/across).
  #
  # REMEMBER: don't call `gets.chomp` anywhere in your code.  Use the
  # `get_user_input` method from the assignment README.
  def test_30_human_player_is_asked_to_place_ships
    player = HumanPlayer.new("Jess")
    $mock_inputs.clear
    $mock_inputs << "A1"
    $mock_inputs << "Down"
    $mock_inputs << "A4"
    $mock_inputs << "Down"
    assert_output("Jess, where would you like to place a ship of length 2?\nAcross or Down?\n"+
                  "Jess, where would you like to place a ship of length 5?\nAcross or Down?\n") do
      player.place_ships([2, 5])
    end
    assert_equal 2, player.ships.length
    assert_equal 5, player.ships[1].length
    assert player.grid.has_ship_on?(1, 1)
    assert player.grid.has_ship_on?(4, 1)
    assert player.grid.has_ship_on?(1, 2)
    refute player.grid.has_ship_on?(1, 3)
  end


  def test_31_human_player_cannot_overlap_ships
    player = HumanPlayer.new("Alice")
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
                  "Alice, where would you like to place a ship of length 3?\nAcross or Down?\n") do
      player.place_ships([2, 3])
    end
    assert_equal 2, player.ships.length
    assert_equal 3, player.ships[1].length
    assert player.grid.has_ship_on?(2, 1)
    assert player.grid.has_ship_on?(2, 2)
    assert player.grid.has_ship_on?(1, 6)
    refute player.grid.has_ship_on?(1, 1)
  end


  # This is the first test that involves you coming up with a strategy. The
  # computer player will need to put the ships somewhere.  Again, it can be as
  # dumb as you want, but the ships can't overlap.
  def test_32_computer_player_automatically_places_ships
    player = ComputerPlayer.new
    assert_output("HAL 9000 has placed its ships.\n") do
      player.place_ships([2, 3, 3, 4, 5])
    end
    assert_equal 5, player.ships.length
    assert_equal 4, player.ships[3].length
  end

  # This is the second bit of "intelligence" that you can make as dumb as you
  # want.  The computer has to be able to decide where to shoot.
  def test_33_computer_players_can_call_shots
    player = ComputerPlayer.new

    computer_shot = player.call_shot
    assert ("A".."J").include?(computer_shot[0])
    assert (1..10).include?(computer_shot[1..-1].to_i)
  end

  def test_34_human_players_can_call_shots
    player = HumanPlayer.new

    $mock_inputs.clear
    $mock_inputs << "G10"
    assert_output("Dave, please enter the coordinates for your next shot (e.g. 'B10'):\n") do
      human_shot = player.call_shot
      assert human_shot[0] = "G"
      assert human_shot[1..-1] = "10"
    end
  end

  def test_35_game_class_exists
    assert Game
  end

  def test_36_games_require_players
    assert_raises(ArgumentError) do
      Game.new
    end
    human = HumanPlayer.new("Frank")
    computer = ComputerPlayer.new
    assert Game.new(human, computer)
  end

  # Tests 35 through XX are testing parts of game play, not the entire game.
  # First, test that the welcome method works.
  def test_37_game_welcomes_player
    human = HumanPlayer.new("Frank")
    computer = ComputerPlayer.new
    game = Game.new(human, computer)
    assert_output("Welcome, Frank and HAL 9000!\nIt's time to play Battleship.\n") do
      game.welcome
    end
  end

  # Second, test that the place_ships method works.
  def test_38_game_can_place_ships
    human = HumanPlayer.new("Frank")
    computer = ComputerPlayer.new
    game = Game.new(human, computer)
    $mock_inputs.clear
    $mock_inputs += standard_placement
    assert_output("Frank, where would you like to place a ship of length 2?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 3?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 4?\nAcross or Down?\n"+
                  "Frank, where would you like to place a ship of length 5?\nAcross or Down?\n"+
                  "HAL 9000 has placed its ships.\n") do
      game.place_ships
    end

    assert_equal 5, human.ships.length
    assert human.grid.has_ship_on?(1, 2)
    assert human.grid.has_ship_on?(3, 3)
    assert human.grid.has_ship_on?(9, 5)
    refute human.grid.has_ship_on?(7, 7)

    assert_equal 5, computer.ships.length
    assert_equal 4, computer.ships[3].length
  end

  def standard_placement
    ["A1","Down","A3","Down","A5","Down","A7","Down","A9","Down"]
  end


  # Third, test that a human player can see the two grids.
  def test_39_display_game_status
    human1 = HumanPlayer.new("Amy")
    human2 = HumanPlayer.new("Beth")
    game = Game.new(human1, human2)

    $mock_inputs.clear
    $mock_inputs += standard_placement # Set up Amy's ships
    $mock_inputs += standard_placement # Set up Beth's ships in the same places

    # The /./ means that it doesn't matter what its puts'ed to the screen.
    assert_output(/./) do
      game.place_ships
    end
    assert_output(starting_game_status) do
      game.display_status
    end
  end

  def starting_game_status
    %Q{SHOTS TAKEN:
    1   2   3   4   5   6   7   8   9   10
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

YOUR BOARD:
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

  # Fourth, test that turns can be taken.  This should call `call_shot` on the
  # player who is up next.
  def test_40_two_humans_can_exchange_fire
    human1 = HumanPlayer.new("Amy")
    human2 = HumanPlayer.new("Beth")
    game = Game.new(human1, human2)

    $mock_inputs.clear
    $mock_inputs += standard_placement # Set up Amy's ships
    $mock_inputs += standard_placement # Set up Beth's ships in the same places

    # The /./ means that it doesn't matter what its puts'ed to the screen.
    assert_output(/./) do
      game.place_ships
    end

    # Amy should fire at Beth at A1 and should be told "Hit!" somewhere in the message.
    $mock_inputs.clear
    $mock_inputs << "A1"
    assert_output(/Hit!/) do
      game.take_turn
    end

    # Beth should fire at Amy at A2 and should be told "Miss!" somewhere in the message.
    $mock_inputs.clear
    $mock_inputs << "A2"
    assert_output(/Miss!/) do
      game.take_turn
    end

    # Amy should fire at Beth at A1 again and be told "Miss!"
    $mock_inputs.clear
    $mock_inputs << "A1"
    assert_output(/Miss!/) do
      game.take_turn
    end

    # Beth should fire at Amy at A1 and should be told "Hit!"
    $mock_inputs.clear
    $mock_inputs << "A1"
    assert_output(/Hit!/) do
      game.take_turn
    end
  end

  # Just checking to see if the display works after some shots have been fired.
  # Note that Amy can see on the top grid where she has hit Beth's ships and
  # missed Beth's ships.
  #
  # This one is surprisingly hard.  Up until now, you won't kept any track of
  # shots taken that were misses.  Now you have to do that.
  def test_41_game_status_shows_hits_and_misses
    human1 = HumanPlayer.new("Amy")
    human2 = HumanPlayer.new("Beth")
    game = Game.new(human1, human2)

    $mock_inputs.clear
    $mock_inputs += standard_placement # Set up Amy's ships
    $mock_inputs += standard_placement # Set up Beth's ships in the same places

    # The /./ means that it doesn't matter what its puts'ed to the screen.
    assert_output(/./) do
      game.place_ships
    end

    # It doesn't matter what messages come up during the turns
    assert_output(/./) do
      $mock_inputs.clear

      $mock_inputs << "C3"     #Amy's hit
      game.take_turn

      $mock_inputs << "B7"     #Beth's hit
      game.take_turn

      $mock_inputs << "C4"     #Amy's miss
      game.take_turn

      $mock_inputs << "B7"     #Beth's miss (she shot in the same spot as last time)
      game.take_turn
    end

    # Now the visuals matter.  Should show Amy's shots up top and Amy's own ships below.
    assert_output(mid_game_status) do
      game.display_status
    end
  end

  def mid_game_status
    %Q{SHOTS TAKEN:
    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   | + | - |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------

YOUR BOARD:
    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A | O |   | O |   | O |   | O |   | O |   |
B | O |   | O |   | O |   | X |   | O |   |
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

  # The previous five tests have required you to build methods on Game:
  # * `welcome`
  # * `place_ships`
  # * `display_status`
  # * `take_turn`
  # Now you have to build a final method on Game which will `play` the game.
  # It should call the four methods listed above in the appropriate order in the
  # appropriate control structures.  Good luck!
  def test_42_game_can_be_won
    human1 = HumanPlayer.new("Amy")
    human2 = HumanPlayer.new("Beth")
    game = Game.new(human1, human2)

    $mock_inputs.clear
    $mock_inputs += standard_placement # Set up Amy's ships
    $mock_inputs += standard_placement # Set up Beth's ships in the same places

    $mock_inputs << "A1"     #Amy's first shot
    $mock_inputs << "A1"     #Beth's first shot
    $mock_inputs << "B1"     #Amy sinks ship 1
    $mock_inputs << "A1"     #Beth doesn't seem to get Battleship.
    $mock_inputs << "A3"     #Amy
    $mock_inputs << "A1"     #Come on, Beth.
    $mock_inputs << "B3"     #Amy
    $mock_inputs << "A1"     #... really?
    $mock_inputs << "C3"     #Amy sinks ship 2
    $mock_inputs << "A1"
    $mock_inputs << "A5"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "B5"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "C5"     #Amy sinks ship 3
    $mock_inputs << "A1"
    $mock_inputs << "A7"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "B7"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "C7"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "D7"     #Amy sinks ship 4
    $mock_inputs << "A1"
    $mock_inputs << "A9"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "B9"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "C9"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "D9"     #Amy
    $mock_inputs << "A1"
    $mock_inputs << "E9"     #Amy wins!

    #When Amy wins, it has to say 'Congratulations, Amy' somewhere in the victory message.
    assert_output(/Congratulations, Amy!/) do
      game.play
    end
  end


  # Well done, developers!  You should now be able to open irb and run the
  # following commands to play your game against the computer:
  #
  # require './battleship'
  # Game.new(HumanPlayer.new("Your Name"), ComputerPlayer.new).play


end
