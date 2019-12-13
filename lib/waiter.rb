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
      Meal.all.select do |meal|
        meal.waiter == self
      end
    end

    def best_tipper
      max_tip = 0
      best_tipper = nil
      # returns the Customer instance associated with the meal that received the largest tip
      self.meals.select do |meal|
        if meal.tip > max_tip
          max_tip = meal.tip
          best_tipper = meal.customer

        end
      end
      return best_tipper
    end
#     max_points = 0
# top_scorer = ""
#
#     # already iterating through with team[:players].each
#    if player[:points] > max_points
#      max_points = player[:points]
#      top_scorer = player[:players_name]




end
