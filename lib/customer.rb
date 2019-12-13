require 'pry'

class Customer
    attr_accessor :age
    attr_reader :name

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        #initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip
        Meal.new(waiter, self, total, tip)
    end

    def meals
        #returns an Array of Meal instances associated with this customer
        ##<Customer:0x00007fa74ca13240 @age=30, @name="Howard">
        Meal.all.select do |meals_array|
            meals_array.customer == self
        end
    end

    def waiters
        self.meals.map do |meal_array|
            meal_array.waiter
        end
    end
  
end