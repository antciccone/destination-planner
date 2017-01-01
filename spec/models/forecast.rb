require 'rails_helper'
describe 'Forcast' do
  context '.tendayforcast' do
    it 'returns an array of weather forcast by zip' do
      VCR.use_cassette("#forcast") do

        weather = Forcast.ten_day(31049)
        weather = weather.first

        expect(weather).to respond_to(:high_temp)
        expect(weather).to respond_to(:low_temp)
        expect(weather).to respond_to(:condition)
        expect(weather).to respond_to(:day)
        expect(weather).to respond_to(:month)
        expect(weather).to respond_to(:weekday)
        expect(weather.weekday.class).to eq(String)
        expect(weather.day.class).to eq(Fixnum)
      end
    end
  end
end
