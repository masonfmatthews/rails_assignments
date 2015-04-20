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
    assert_equal car.number_of_wheels, 4
    assert_equal car.number_of_engines, 1
    assert_equal car.number_of_gears, 4
  end

  def test_c_electric_car
    car = ElectricCar.new(30)
    assert_equal car.travel_time(30), 1
    assert_equal car.travel_time(120), 4
    assert_equal car.number_of_wheels, 4
    assert_equal car.number_of_engines, 1
    assert_equal car.number_of_gears, 1
  end


  def test_d_hybrid_car
    car = HybridCar.new(40)
    assert_equal car.travel_time(40), 1
    assert_equal car.travel_time(120), 3
    assert_equal car.number_of_wheels, 4
    assert_equal car.number_of_engines, 2
    assert_equal car.number_of_gears, 4
  end

  def test_e_motorcycle
    motorcycle = Motorcycle.new(40)
    assert_equal motorcycle.travel_time(40), 1
    assert_equal motorcycle.travel_time(120), 3
    assert_equal motorcycle.number_of_wheels, 2
    assert_equal motorcycle.number_of_engines, 1
    assert_equal motorcycle.number_of_gears, 4
  end

  def test_f_plane
    plane = Plane.new(400)
    assert_equal plane.travel_time(400), 1
    assert_equal plane.travel_time(1200), 3
    assert_equal plane.number_of_wheels, 6
    assert_equal plane.number_of_engines, 2
    assert_equal plane.number_of_gears, 1
    assert_equal plane.number_of_wings, 2
  end

  def test_g_bicycle
    bike = Bicycle.new(4, 15)
    assert_equal bike.travel_time(4), 1
    assert_equal bike.travel_time(12), 3
    assert_equal bike.number_of_wheels, 2
    assert_equal bike.number_of_engines, 0
    assert_equal bike.number_of_gears, 15
  end

  def test_h_unknown_wings
    car = Vehicle.new(30)
    assert_raises(NoWingsError) do
      car.number_of_wings
    end

    bike = Bicycle.new(4, 21)
    assert_raises(NoWingsError) do
      bike.number_of_wings
    end
  end
end
