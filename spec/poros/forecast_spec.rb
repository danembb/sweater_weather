require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has attributes', :vcr do
    coordinates = MapquestFacade.coordinates('northampton,ma')
    forecast = ForecastFacade.forecast(coordinates.lat, coordinates.lng)

    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to eq(nil)
    expect(forecast.type).to eq("forecast")
    expect(forecast.current_weather).to be_a(CurrentWeather)
    forecast.daily_weather.each do |day_weather|
      expect(day_weather).to be_a(DailyWeather)
    end
    forecast.hourly_weather.each do |hour_weather|
      expect(hour_weather).to be_a(HourlyWeather)
    end
  end
end
