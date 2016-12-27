require 'rails_helper'

describe 'WeatherService' do
  context 'returns 10 day forcast for zip code' do
    it "#weather_by_zip" do
      VCR.use_cassette("#service") do

        weather = WeatherService.new

        expect(weather.ten_day_weather_by_zip(31049).class).to eq(Array)
        expect(weather.ten_day_weather_by_zip(31049).first).to have_key(:date)
        expect(weather.ten_day_weather_by_zip(31049).first).to have_key(:high)
        expect(weather.ten_day_weather_by_zip(31049).first).to have_key(:low)
        expect(weather.ten_day_weather_by_zip(31049).first).to have_key(:conditions)
      end
    end
  end
end
