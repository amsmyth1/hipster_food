class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.in_stock?(item)
    end
  end

  def total_inventory
    total_inventory = Hash.new(0)
    total_items.each do |item|
      total_inventory
      total_inventory[item] = item_quanitity_and_trucks(item)
    end
    total_inventory
  end


  def item_quanitity_and_trucks(item)
    quantity = 0
    item_quanitity_and_trucks = {}
    item_quanitity_and_trucks[:quantity] = item_count(item)
    item_quanitity_and_trucks[:food_trucks] = item_trucks(item)
    item_quanitity_and_trucks
  end

  def total_inventory
    total_inventory = Hash.new(0)
    total_items.each do |item|
      sub_hash = {}
      total_inventory[item] = item_quanitity_and_trucks(item)
    end
    total_inventory
  end

  def item_count(item)
    @food_trucks.sum do |food_truck|
      food_truck.check_stock(item)
    end
  end

  def item_trucks(item)
    @food_trucks.select do |truck|
      truck.in_stock?(item)
    end
  end

  def total_items
    @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
  end

  def sorted_items_list
    sort = total_items.sort_by do |item|
      item.name
    end
    sort.map do |item|
      item.name.to_s
    end
  end

  def overstocked_items
    total_items.select do |item|
      item_count(item) > 50 && item_duplicate?(item)
    end
  end

  def item_duplicate?(item)
    trucklist = []
    @food_trucks.each do |truck|
      if truck.in_stock?(item)
        trucklist << truck
      end
    end
    if trucklist.count > 1
      true
    else
      false
    end
  end
end
