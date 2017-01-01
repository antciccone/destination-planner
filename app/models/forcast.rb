class Forcast

  attr_reader :weekday, :month, :day, :high_temp, :low_temp, :condition

  def initialize(service={})
    @weekday = service[:date][:weekday]
    @month = service[:date][:monthname]
    @day = service[:date][:day]
    @high_temp = service[:high][:fahrenheit]
    @low_temp = service[:low][:fahrenheit]
    @condition = service[:conditions]
  end

  def self.forcast(zipcode)
    WeatherService.new.ten_day_weather_by_zip(zipcode).map do |raw_data|
      Forcast.new(raw_data)
    end
  end
end
