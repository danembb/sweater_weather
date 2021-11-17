require 'rails_helper'

RSpec.describe 'forecast facade' do
  it 'can return the forecast given coordinates', :vcr do
    coordinates = MapquestFacade.coordinates('northampton,ma')
    forecast = ForecastFacade.forecast(coordinates.lat, coordinates.lng)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(CurrentWeather)
    expect(forecast.current_weather.conditions).to be_a(String)
    expect(forecast.current_weather.datetime).to be_a(String)
    expect(forecast.current_weather.feels_like).to be_a(Numeric)
    expect(forecast.current_weather.humidity).to be_a(Numeric)
    expect(forecast.current_weather.icon).to be_a(String)
    expect(forecast.current_weather.sunrise).to be_a(String)
    expect(forecast.current_weather.sunset).to be_a(String)
    expect(forecast.current_weather.temperature).to be_a(Numeric)
    expect(forecast.current_weather.uvi).to be_a(Numeric)
    expect(forecast.current_weather.visibility).to be_a(Numeric)

    forecast.daily_weather.each do |day_weather|
      expect(day_weather).to be_a(DailyWeather)
      expect(day_weather.conditions).to be_a(String)
      expect(day_weather.date).to be_a(String)
      expect(day_weather.icon).to be_a(String)
      expect(day_weather.max_temp).to be_a(Numeric)
      expect(day_weather.min_temp).to be_a(Numeric)
      expect(day_weather.sunrise).to be_a(String)
      expect(day_weather.sunset).to be_a(String)
    end
    forecast.hourly_weather.each do |hour_weather|
      expect(hour_weather).to be_a(HourlyWeather)
      expect(hour_weather.conditions).to be_a(String)
      expect(hour_weather.icon).to be_a(String)
      expect(hour_weather.temperature).to be_a(Numeric)
      expect(hour_weather.time).to be_a(String)
    end
  end

  it 'can create an hourly forecast for 48 hours', :vcr do
    coordinates = MapquestFacade.coordinates('northampton,ma')
    forecast = ForecastFacade.destination_weather(coordinates.lat, coordinates.lng)

    forecast.each do |hour|
      expect(hour).to be_an(HourlyWeather)
      expect(hour.conditions).to be_a(String)
      expect(hour.icon).to be_a(String)
      expect(hour.temperature).to be_a(Numeric)
      expect(hour.time).to be_a(String)
    end
  end
end
