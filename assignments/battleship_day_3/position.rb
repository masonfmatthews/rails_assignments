class Position
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @hit = false
  end

  def hit?
    @hit
  end

  def hit!
    return false if @hit
    @hit = true
  end
end
