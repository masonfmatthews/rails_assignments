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
    if @hit
      return false
    else
      @hit = true
    end
  end
end
