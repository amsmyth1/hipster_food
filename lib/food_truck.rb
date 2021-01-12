class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, count)
    @inventory[item] += count
  end

  def potential_revenue
    @inventory.sum do |item, quantity|
      item.math_price * quantity.to_f
    end
  end

  def in_stock?(item)
    @inventory.keys.any?(item)
  end
end
