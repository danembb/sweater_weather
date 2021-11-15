class Forecast

  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @current_weather = CurrentWeather.new(data[:current])
    @daily_weather = DailyWeather.new(data[:daily])
    @hourly_weather = HourlyWeather.new(data[:hourly])
  end
end
