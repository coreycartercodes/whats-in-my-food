class FoodsController < ApplicationController

  def index
    ingredient = params[:ingredient]
    conn = Faraday.new(url: 'https://api.nal.usda.gov/')
    connection = conn.get("fdc/v1/foods/search?query=#{ingredient}&pageSize=10&API_KEY=#{ENV['FOOD_API_KEY']}")
    json = JSON.parse(connection.body, symbolize_names: true)
    @total_count = json[:totalHits]
    @foods = json[:foods].map { |food_data| Food.new(food_data) }
  end

end