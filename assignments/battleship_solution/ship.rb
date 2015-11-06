class Ship
  attr_reader :length

  def initialize(length)
    @length = length
    @positions = []
  end

  def placed?
    @positions != []
  end

  def place(x, y, across)
    unless placed?
      length.times do |i|
        @positions << (across ? Position.new(x+i, y) : Position.new(x, y+i))
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

  def sunk?
    !@positions.empty? && @positions.all? {|p| p.hit?}
  end
  
  def hit_on?(x, y)
    position = covers?(x, y)
    position && position.hit?
  end
end
