class WeatherService

  def initialize
    @conn ||= Faraday.new(url: "http://api.wunderground.com") do |faraday|
          faraday.adapter  Faraday.default_adapter
    end
  end

  def ten_day_weather_by_zip(zipcode)
    weather_json = conn.get do |req|
      req.url "api/#{ENV['API_KEY']}/forecast10day/q/#{zipcode}.json"
    end
    json_parse(weather_json.body)[:forecast][:simpleforecast][:forecastday]
  end

  def json_parse(json)
    JSON.parse(json, symbolize_names: true)
  end

  private

    attr_reader :conn
end
