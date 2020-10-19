class Food
  attr_reader :description,
              :id,
              :code,
              :brand,
              :ingredients

  def initialize(food_data)
    @description = food_data[:description]
    @id = food_data[:fdcId]
    @code = food_data[:gtinUpc]
    @brand = food_data[:brandOwner]
    @ingredients = food_data[:ingredients]
  end

end