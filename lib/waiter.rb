require 'pry'
class Waiter
    attr_reader :name
    attr_accessor :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meals_array|
            meals_array.waiter == self
        end
    end

    def best_tipper
        best_tip = 0
        best_tipper = nil
        #returns the Customer instance associated with the meal that received the largest tip
        self.meals.select do |meal|
            if meal.tip > best_tip
                best_tip = meal.tip
                best_tipper = meal.customer
            end
        end
        best_tipper
    end

end