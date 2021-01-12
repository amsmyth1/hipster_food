require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < Minitest::Test

  def test_it_exists_with_attributes
    ft = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, ft
    assert_equal "Rocky Mountain Pies", ft.name
    assert_equal ({}), ft.inventory
  end

  def test_it_has_stock
    ft = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    assert_equal 0, ft.check_stock(item1)

    ft.stock(item1, 30)
    expect = {item1 => 30}

    assert_equal expect, ft.inventory
    assert_equal 30, ft.check_stock(item1)

    ft.stock(item1, 25)
    expect = {item1 => 55}

    assert_equal expect, ft.inventory
    assert_equal 55, ft.check_stock(item1)

    ft.stock(item2, 12)
    expect = {item1 => 55, item2 => 12}

    assert_equal expect, ft.inventory
    assert_equal 12, ft.check_stock(item2)
  end
end
