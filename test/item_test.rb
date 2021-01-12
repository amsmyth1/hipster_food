require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class ItemTest < Minitest::Test

  def test_it_exists_with_attributes
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    assert_instance_of Item, item1
    assert_equal ('Peach Pie (Slice)').to_sym, item1.name
    assert_equal ("$3.75"), item1.price
  end

  def test_math_price
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Peach Pie (Slice)', price: "$12.75"})

    assert_equal 3.75, item1.math_price
    assert_equal 12.75, item2.math_price
  end
end
