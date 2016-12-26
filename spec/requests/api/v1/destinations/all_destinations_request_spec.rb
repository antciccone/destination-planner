require 'rails_helper'


describe 'all destinations endpoint' do
  context 'api/v1/destinations' do
    it 'returns all destinations' do
      Destination.create(name: "Sparta", zip: "07871", description: "childhood home", image_url: "http://www.scottolson.us/mohawk/lm12.jpg")
      Destination.create(name: "Hells Kitchen", zip: "10036", description: "NYC district", image_url: "http://www.scottolson.us/mohawk/lm12.jpg")

      get '/api/vi/destinations'

      destinations_json


    end
  end
end
