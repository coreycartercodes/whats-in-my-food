require 'rails_helper'

RSpec.describe 'Food Search', type: :feature do
  describe 'page' do
    it 'can search by food as ingredient' do
      @foods = FoodFacade.find('sweet potatoes')
      visit '/'

      fill_in :ingredient, with: 'sweet potatoes'

      click_button 'Search'

      expect(current_path).to eq('/foods')
      expect(@foods.size).to eq(10)
      save_and_open_page
    end
  end
end