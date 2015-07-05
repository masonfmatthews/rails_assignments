require 'minitest/autorun'
require 'minitest/pride'
require './vehicle'

class VehicleTest < Minitest::Test

  #This is not good practice, AND it forces you to do dumb things like test_c_
  #  in the code.  However, it's easier to follow as you're learning if the
  #  tests always run in the same order.
  def self.test_order
    :alpha
  end

  def test_a_vehicle_class_exists
    assert Vehicle
  end

  def test_b_vehicle_has_normal_methods
    car = Vehicle.new(40)
    assert_equal car.travel_time(40), 1
    assert_equal car.travel_time(120), 3
  end

  def test_c_other_classes_exist
    assert Plane
    assert Truck
    assert Helicopter
  end

  def test_d_cargo_planes
    v = Plane.new(100)
    assert v.cargo?
  end

  def test_j_cargo_trucks
    v = Truck.new(100)
    assert v.cargo?
  end

  def test_k_cargo_fails
    v = Vehicle.new(100)
    assert_raises(NoMethodError) do
      v.cargo?
    end
    v = Helicopter.new(100)
    assert_raises(NoMethodError) do
      v.cargo?
    end
  end

  def test_l_flying_planes
    v = Plane.new(100)
    assert v.can_fly?
  end

  def test_m_flying_helicopters
    v = Helicopter.new(100)
    assert v.can_fly?
  end

  def test_n_flying_fails
    v = Truck.new(100)
    assert_raises(NoMethodError) do
      v.can_fly?
    end
    v = Vehicle.new(100)
    assert_raises(NoMethodError) do
      v.can_fly?
    end
  end
end
