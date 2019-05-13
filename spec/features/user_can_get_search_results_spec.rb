require 'rails_helper'

describe 'As a User on the homepage' do
  context 'when I fill in a search form with 80206' do
    it 'shows the matching stations of my query' do

      visit '/'

      fill_in :q, with: "80206"

      click_on("Locate")

      expect(current_path).to eq("/search")

      expect(page).to have_css('.station', count: 93)
      expect(page).to have_css('.close_station', count: 15)

      within first('.station') do
        expect(page).to have_content("Name: ")
        expect(page).to have_content("Address: ")
        expect(page).to have_content("Fuel Types: ")
        expect(page).to have_content("Distance: ")
        expect(page).to have_content("Access Times: ")
      end

      within first('.close_station') do
        expect(page).to have_content("Name: ")
        expect(page).to have_content("Address: ")
        expect(page).to have_content("Fuel Types: ")
        expect(page).to have_content("Distance: ")
        expect(page).to have_content("Access Times: ")
      end
    end
  end
end
