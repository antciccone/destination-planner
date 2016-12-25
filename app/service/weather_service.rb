class WeatherService

  def initialize
    @conn ||= Faraday.new(url: "http://api.wunderground.com") do |faraday|
          faraday.adapter  Faraday.default_adapter
    end
  end

  def ten_day_weather_by_zip(zipcode)
    weather_json = conn.get "api/#{ENV['API_KEY']}/forecast10day/q/#{zipcode}.json"
  end

  private

  attr_reader :conn
end
