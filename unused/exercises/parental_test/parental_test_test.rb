gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './human_genome'

class ParentalTestTest < Minitest::Test

  #This is not good practice, AND it forces you to do dumb things like test_c_
  #  in the code.  However, it's easier to follow as you're learning if the
  #  tests always run in the same order.
  def self.test_order
    :alpha
  end

  def test_a_class_exists
    assert HumanGenome
  end

  def test_b_initializer_takes_array_parameter
    assert HumanGenome.new([23, 54, 23, 12, 11, 85])
  end

  def test_c_true_parent
    human = HumanGenome.new([23, 54, 23, 12, 11, 85])
    assert human.parent_of?([23, 11, 85])
  end

  def test_d_not_parent
    human = HumanGenome.new([23, 54, 23, 12, 11, 85])
    refute human.parent_of?([123, 154, 123])
  end

  def test_e_no_child
    human = HumanGenome.new([23, 54, 23, 12, 11, 85])
    assert_raises(RuntimeError) do
      human.parent_of?([])
    end
  end

  def test_f_partial_child
    human = HumanGenome.new([23, 54, 23, 12, 11, 85])
    assert_raises(RuntimeError) do
      human.parent_of?([23])
    end
  end

  def test_g_uneven_initialization
    assert_raises(RuntimeError) do
      HumanGenome.new([23])
    end
  end

  def test_h_empty_initialization
    assert_raises(RuntimeError) do
      HumanGenome.new([])
    end
  end
end
