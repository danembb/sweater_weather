class ForecastFacade
  class << self
    def forecast(lat, lng)
      response = OpenweatherService.get_forecast(lat, lng)
      all_weather = Forecast.new(response)
      # current = CurrentWeather.new(all_weather.current_weather)
      # daily = DailyWeather.new(all_weather.daily_weather)
      # hourly = HourlyWeather.new(all_weather.hourly_weather)
    end
  end
end
