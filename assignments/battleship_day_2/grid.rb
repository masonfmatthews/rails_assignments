class Grid
  attr_reader :ships

  def initialize
    @ships = []
  end

  def has_ship_on?(x, y)
    found = false
    @ships.each do |s|
      found = true if s.covers?(x, y)
    end
    found
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @ships << ship
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    display_line
    ("A".."J").each do |l|
      puts l + " |   |   |   |   |   |   |   |   |   |   |"
    end
    display_line
  end

  private def display_line
    puts "  -----------------------------------------"
  end
end
