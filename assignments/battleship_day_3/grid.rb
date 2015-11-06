class Grid
  attr_reader :ships

  def initialize
    @ships = []
  end

  def has_ship_on?(x, y)
    @ships.each do |s|
      return s if s.covers?(x, y)
    end
    false
  end

  def fire_at(x, y)
    ship = has_ship_on?(x, y)
    ship && ship.fire_at(x, y)
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    unless @ships.any? {|s| s.overlaps_with?(ship)}
      @ships << ship
    end
  end

  def display
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        ship = has_ship_on?(x, y)
        line << if ship && ship.hit_on?(x, y)
                  " X |"
                elsif ship
                  " O |"
                else
                  "   |"
                end
      end
      puts line
    end
    display_line
  end

  def sunk?
    !@ships.empty? && @ships.all? {|s| s.sunk?}
  end

  def x_of(coordinates)
    coordinates[/\d+/].to_i
  end

  def y_of(coordinates)
    coordinates[0].ord - 'A'.ord + 1
  end

  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

  private def display_line
    puts "  -----------------------------------------"
  end
end
