class Item
  attr_reader :name,
              :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def math_price
    @price.delete("$").to_f
  end
end
