require 'rails_helper'

describe 'As a user' do
  context 'when i visit a city show page' do
    scenario 'I can see the 10 day forcast for that city' do
      VCR.use_cassette("#story") do


        destination = Destination.create(name: "Sparta", zipcode: "07871", description: "childhood home")

        visit "/"
        click_on "show"

        expect(page).to have_content("Sparta")
        expect(page).to have_content("07871")
        expect(page).to have_content("High")
        expect(page).to have_content("Low")
        expect(page).to have_content("Day")
        expect(page).to have_content("Month")
        expect(page).to have_content("Conditions")
      end 
    end
  end
end



Then I should see the destination's name, zipcode, description, and 10 day weather forecast
The weather forecast is specific to the destination whose page I'm on
The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions
