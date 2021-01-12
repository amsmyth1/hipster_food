class Item
  attr_reader :name,
              :price

  def initialize(attributes)
    @name = attributes[:name].to_sym
    @price = attributes[:price]
  end

  def math_price
    @price.delete("$").to_f
  end
end
