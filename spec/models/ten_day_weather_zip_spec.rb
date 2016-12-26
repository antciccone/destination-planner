require 'rails_helper'

describe 'TenDayWeatherByZip' do
  context '.tendayforcast' do
    it 'returns an array of weather forcast by zip' do
      VCR.use_cassette("#forcast") do

        weather = TenDayWeatherByZip.forcast(31049)
        expect(weather.first).to respond_to(:high_temp)
        expect(weather.first).to respond_to(:low_temp)
        expect(weather.first.weekday.class).to eq(String)
        expect(weather.first.day.class).to eq(Fixnum)
      end
    end
  end
end
