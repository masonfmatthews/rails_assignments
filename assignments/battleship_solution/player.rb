class Player
  attr_reader :grid
  def initialize
    @grid = Grid.new
  end

  def ships
    @grid.ships
  end

  def display_ocean_grid
  end

  def display_target_grid
  end

  def fire_at_coordinates(coords)
    grid.fire_at_coordinates(coords)
  end

  def record_hit(coords)
    grid.hit_opponent(coords)
  end

  def record_miss(coords)
    grid.miss_opponent(coords)
  end

  def sunk?
    grid.sunk?
  end
end
