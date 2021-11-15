class ForecastFacade
  class << self
    def forecast(lat, lng)
      response = OpenweatherService.get_forecast(lat, lng)
      current = CurrentWeather.new(response[:current])

      daily = response[:daily][0..4].map do |day|
        DailyWeather.new(day)
      end

      hourly = response[:hourly][0..7].map do |day|
        HourlyWeather.new(day)
      end

      Forecast.new(current, daily, hourly)
    end
    # 
    # def current_forecast(lat, lng)
    #   response = OpenweatherService.get_forecast(lat, lng)
    #   current = CurrentWeather.new(response[:current])
    #   Forecast.new(current)
    # end
  end
end
