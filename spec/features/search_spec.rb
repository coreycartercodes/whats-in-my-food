require 'rails_helper'

RSpec.describe 'Food Search', type: :feature do
  describe 'page' do
    it 'can search by food as ingredient' do

      visit '/'

      fill_in :ingredient, with: 'sweet potatoes'

      click_button 'Search'

      expect(current_path).to eq('/foods')
      expect(@foods.size).to eq(10)
    end
  end
end