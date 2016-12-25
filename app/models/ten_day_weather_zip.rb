class TenDayWeatherByZip

  def initialize(service={})
  end

  def self.forcast(zipcode)
    WeatherService.new.ten_day_weather_by_zip(zipcode).map do |raw_data|
      TenDayWeatherByZip(raw_data)
    end
  end

end
