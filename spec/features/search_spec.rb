require 'rails_helper'

RSpec.describe 'Food Search', type: :feature do
  describe 'page' do
    it 'can search by food as ingredient' do
      @foods = FoodFacade.find_dishes('sweet potatoes')
      @total_count = FoodFacade.find_count("sweet potatoes")
      visit '/'

      fill_in :ingredient, with: 'sweet potatoes'

      click_button 'Search'

      expect(current_path).to eq('/foods')
      expect(@foods.count).to eq(10)
      expect(@total_count).to eq(38680)
      expect(page).to have_content('38680 Total Dishes Found!')
    end
  end
end