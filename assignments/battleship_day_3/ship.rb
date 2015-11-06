class Ship
  def initialize(length)
    @length = length
    @positions = []
  end

  def length
    @length
  end

  def place(x, y, across)
    if @positions == []
      length.times do |i|
        if across
          @positions << Position.new(x+i, y)
        else
          @positions << Position.new(x, y+i)
        end
      end
    end
  end

  def covers?(x, y)
    @positions.each do |p|
      return p if p.x == x && p.y == y
    end
    return false
  end

  def overlaps_with?(other_ship)
    @positions.any? {|p| other_ship.covers?(p.x, p.y)}
  end

  def fire_at(x, y)
    position = covers?(x, y)
    position && position.hit!
  end

  def hit_on?(x, y)
    position = covers?(x, y)
    position && position.hit?
  end

  def sunk?
    !@positions.empty? && @positions.all? {|p| p.hit?}
  end
end
