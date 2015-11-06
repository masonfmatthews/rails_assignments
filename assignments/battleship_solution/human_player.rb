require './player'

class HumanPlayer < Player
  attr_accessor :name

  def initialize(name="Dave")
    @name = name
    super()
  end

  def place_ships(lengths)
    ship_number = 0
    while(ship_number < lengths.length)
      len = lengths[ship_number]
      puts "#{name}, where would you like to place a ship of length #{len}?"
      coordinates = get_user_input
      puts "Across or Down?"
      direction = get_user_input

      if grid.place_ship(Ship.new(len), grid.x_of(coordinates),
                       grid.y_of(coordinates), direction=="Across")
        ship_number += 1
      else
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
      end
    end
  end

  def call_shot
    puts "#{name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    get_user_input
  end

  def display_ocean_grid
    grid.display
  end

  def display_target_grid
    grid.display_shots
  end
end
