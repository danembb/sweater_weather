require 'rails_helper'

RSpec.describe 'forecast' do
  it 'exists and has attributes', :vcr do
    data = OpenweatherService.get_forecast(42.31952, -72.629756)
    forecast = ForecastFacade.forecast

    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(CurrentWeather)
    expect(forecast.daily_weather).to be_a(DailyWeather)
    expect(forecast.hourly_weather).to be_an(HourlyWeather)
  end
end
