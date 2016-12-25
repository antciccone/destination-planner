require 'rails_helper'

describe 'WeatherService' do
  context 'returns 10 day forcast for zip code' do
    it "#weather_by_zip" do

      weather = WeatherService.new

      expect(weather.weather_by_zip(07871).class).to eq(Array)
      expect(weather.weather_by_zip(07871).to have_key(:date)
      expect(weather.weather_by_zip(07871).to have_key(:high)
      expect(weather.weather_by_zip(07871).to have_key(:low)
    end
  end
end
