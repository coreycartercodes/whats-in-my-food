class FoodsController < ApplicationController

  def index
    @foods = FoodFacade.find_dishes(params[:ingredient])
    @total_count = FoodFacade.find_count(params[:ingredient])
  end

end