class FoodsController < ApplicationController

  def index
    @foods = FoodFacade.find(params[:ingredient])
  end

end