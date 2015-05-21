require 'minitest/autorun'
require 'minitest/pride'

# Write two classes which inherit from the Vehicle class below.  You will also
# need to add a method to the Vehicle class during this challenge.

class Vehicle
  def initialize(make, model)
    @make = make
    @model = model
  end

  def number_of_gears
    4
  end

  def number_of_tires
    4
  end
end

# WRITE YOUR CODE HERE.

class InheritanceChallenge < MiniTest::Test

  def test_classes_exist
    assert ElectricCar
    assert Motorcycle
  end

  def test_classes_inherit
    assert_equal Vehicle, ElectricCar.superclass
    assert_equal Vehicle, Motorcycle.superclass
  end

  def test_initializer_takes_make_and_model
    assert ElectricCar.new("Nissan", "Leaf")
    assert Vehicle.new("Honda", "CTX700N")
  end

  def test_describe
    assert_equal "This is a Nissan Leaf", ElectricCar.new("Nissan", "Leaf").describe
    assert_equal "This is a Honda CTX700N", Motorcycle.new("Honda", "CTX700N").describe
  end

  def test_number_of_tires
    assert_equal 4, ElectricCar.new("Nissan", "Leaf").number_of_tires
    assert_equal 2, Motorcycle.new("Honda", "CTX700N").number_of_tires
  end

  def test_number_of_gears
    assert_equal 1, ElectricCar.new("Nissan", "Leaf").number_of_gears
    assert_equal 4, Motorcycle.new("Honda", "CTX700N").number_of_gears
  end

  def test_trike
    assert TrikeMotorcycle
    assert_equal Vehicle, TrikeMotorcycle.superclass.superclass
    assert_equal 3, TrikeMotorcycle.new("Can-Am", "Spyder").number_of_tires
  end

end
