require 'rails_helper'

describe 'As a user' do
  context 'when i visit a city show page' do
    scenario 'I can see the 10 day forcast for that city' do
      VCR.use_cassette("#story") do


        destination = Destination.create(name: "Sparta", zip: "07871", description: "childhood home", image_url: "http://www.scottolson.us/mohawk/lm12.jpg")

        visit "/"
        click_on "Show"

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
