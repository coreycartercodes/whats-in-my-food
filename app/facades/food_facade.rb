class FoodFacade
  def self.find(ingredient)
    json = FoodService.find_food(ingredient)
  end

  def self.find_dishes(ingredient)
    json = find(ingredient)
    @foods = json[:foods].map { |food_data| Food.new(food_data) }
  end

  def self.find_count(ingredient)
    find(ingredient)[:totalHits]
  end
end