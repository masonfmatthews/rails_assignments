class Grid
  attr_reader :ships

  def initialize
    @ships = []
    @hits_on_opponent = []
    @misses_on_opponent = []
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

  def fire_at_coordinates(string)
    fire_at(x_of(string), y_of(string))
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    unless @ships.any? {|s| s.overlaps_with?(ship)}
      @ships << ship
    end
  end

  def display
    display_with_block do |x, y|
      ship = has_ship_on?(x, y)
      if ship && ship.hit_on?(x, y)
        " X |"
      elsif ship
        " O |"
      else
        "   |"
      end
    end
  end

  def display_shots
    display_with_block do |x, y|
      if @hits_on_opponent.include?([x, y])
        " + |"
      elsif @misses_on_opponent.include?([x, y])
        " - |"
      else
        "   |"
      end
    end
  end

  def display_with_block
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i+1
      line = l + " |"
      (1..10).each do |x|
        line << yield(x, y)
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

  def miss_opponent(c)
    @misses_on_opponent << [x_of(c), y_of(c)]
  end

  def hit_opponent(c)
    @hits_on_opponent << [x_of(c), y_of(c)]
  end

  private def display_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

  private def display_line
    puts "  -----------------------------------------"
  end
end
