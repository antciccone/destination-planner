require 'rails_helper'

describe 'TenDayWeatherByZip' do
  context '.tendayforcast' do
    it 'returns an array of weather forcast by zip' do

      weather = TenDayWeatherByZip.forcast(31049)
      expect(weather.first).to respond_to(:high)
      expect(weather.first).to respond_to(:low)
      expect(weather.first.high.class).to eq(String)
    end
  end
end
