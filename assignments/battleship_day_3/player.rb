class Player
  attr_reader :grid
  def initialize
    @grid = Grid.new
  end

  def ships
    @grid.ships
  end
end
