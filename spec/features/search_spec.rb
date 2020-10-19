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
    it 'can return error if no foods found' do
      @foods = FoodFacade.find_dishes('asdf')
      @total_count = FoodFacade.find_count("asdf")
      visit '/'

      fill_in :ingredient, with: 'asdf'

      click_button 'Search'

      expect(current_path).to eq('/')
      expect(@foods.count).to eq(0)
      expect(@total_count).to eq(0)
      expect(page).to have_content('Sorry, no dishes were found.')
    end

    it 'can return error if nil ingredient' do
      @foods = FoodFacade.find_dishes('')
      @total_count = FoodFacade.find_count('')
      visit '/'

      fill_in :ingredient, with: ''

      click_button 'Search'

      expect(current_path).to eq('/')
      expect(page).to have_content('Please enter an ingredient')
    end
  end
end