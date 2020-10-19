class FoodFacade

  def self.find(ingredient)
    json = FoodService.find_food(ingredient)
    @total_count = json[:totalHits]
    @foods = json[:foods].map { |food_data| Food.new(food_data) }
  end
end