require 'rails_helper'


describe 'all destinations endpoint' do
  context 'api/v1/destinations' do
    it 'returns all destinations' do
      destination1 = Destination.create(name: "Sparta", zip: "07871", description: "childhood home", image_url: "http://www.scottolson.us/mohawk/lm12.jpg")
      destination2 = Destination.create(name: "Hells Kitchen", zip: "10036", description: "NYC district", image_url: "http://www.scottolson.us/mohawk/lm12.jpg")

      get "/api/v1/destinations"

      destinations_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(destinations_json.class).to eq(Array)
      expect(destinations_json.first['id']).to eq(destination1.id)
    end
  end

  it 'returns a single destination' do
    destination1 = Destination.create(name: "Sparta", zip: "07871", description: "childhood home", image_url: "http://www.scottolson.us/mohawk/lm12.jpg")
    destination2 = Destination.create(name: "Hells Kitchen", zip: "10036", description: "NYC district", image_url: "http://www.scottolson.us/mohawk/lm12.jpg")

    get "/api/v1/destinations/#{destination1.id}"

    destination_json = JSON.parse(response.body)

    expect(response).to be_success
    expect(destination_json['name']).to eq("Sparta")
    expect(destination_json['zip']).to eq("07871")
  end
end
