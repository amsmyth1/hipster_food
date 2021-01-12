require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/food_truck'

class FoodTruckTest < Minitest::Test

  def test_it_exists_with_attributes
    ft = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, ft
    assert_equal "Rocky Mountain Pies", ft.name
  end
end
