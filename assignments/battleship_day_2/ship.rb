class Ship
  def initialize(length)
    @length = length
    @positions = []
  end

  def length
    @length
  end

  def place(x, y, across)
    return false if @positions != []
    length.times do |i|
      @positions << (across ? Position.new(x+i, y) : Position.new(x, y+i))
    end
  end

  def covers?(x, y)
    @positions.each do |p|
      return p if p.x == x && p.y == y
    end
    false
  end

  def overlaps_with?(other_ship)
    found = false
    @positions.each do |p|
      found = true if other_ship.covers?(p.x, p.y)
    end
    found
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
    return false if @positions.empty?
    all_hit = true
    @positions.each do |p|
      all_hit = false if !p.hit?
    end
    all_hit
  end
end
