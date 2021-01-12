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

  # def food_truck_names
  #   names = []
  #   @food_trucks.each do |food_truck|
  #     names << food_truck.name
  #   end
  #   names
  # end
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
end
