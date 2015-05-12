class Vehicle
  def initialize(avg)
    @average_speed = avg
  end

  def travel_time(distance)
    distance / @average_speed
  end
end


module Flyer
  def can_fly?
    return true
  end
end

module Carrier
  def cargo?
    return true
  end
end


class Truck < Vehicle
  include Carrier
end

class Helicopter < Vehicle
  include Flyer
end

class Plane < Vehicle
  include Flyer
  include Carrier
end
