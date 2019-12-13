class Waiter

    attr_accessor :name, :experience 
    @@all = []

    def initialize(name, experience)

        @name = name
        @experience = experience 
        @@all << self 
    end 

    def self.all 

        return @@all
    end 

    def new_meal(customer, total, tip)

        Meal.new(self, customer, total, tip)
    end 

    def meals

        Meal.all.select{|meal| meal.waiter == self }
    end 

    def best_tip

        #finds out the best tip ever received, note the comparison enum 
        best_tip = self.meals.max{|meal_a, meal_b| meal_a.tip <=> meal_b.tip }
    end 

    def best_tipper

        #finds out the customer that provided the best tip 
        return self.best_tip.customer 
    end 

end