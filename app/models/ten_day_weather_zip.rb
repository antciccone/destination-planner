class TenDayWeatherByZip

  def initialize(service={})
    require "pry"; binding.pry
  end

  def tendayforcast(zipcode)
    WeatherService.new.ten_day_weather_by_zip(zipcode).map do |raw_data|
      TenDayWeatherByZip(raw_data)
    end 
  end

end
