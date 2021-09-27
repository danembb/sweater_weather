class ForecastFacade
  class << self
    def forecast(lat, long)
      response = OpenweatherService.get_forecast(lat, long)
      Forecast.new(response)
    end
  end
end
