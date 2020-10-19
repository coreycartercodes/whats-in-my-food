class FoodService
  def self.conn
    Faraday.new(url: 'https://api.nal.usda.gov/')
  end

  def self.find_food(ingredient)
    connection = conn.get("fdc/v1/foods/search?query=#{ingredient}&pageSize=10&API_KEY=#{ENV['FOOD_API_KEY']}")
    JSON.parse(connection.body, symbolize_names: true)
  end
end