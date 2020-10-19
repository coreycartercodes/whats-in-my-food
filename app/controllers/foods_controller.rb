class FoodsController < ApplicationController
  def index
    @foods = FoodFacade.find_dishes(params[:ingredient])
    @total_count = FoodFacade.find_count(params[:ingredient])
    return unless @foods == []

    flash[:danger] = 'Sorry, no dishes were found.'
    redirect_to '/'
  end
end