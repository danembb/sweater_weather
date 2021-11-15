require 'rails_helper'

RSpec.describe 'forecast facade', :vcr do
  it 'can return the forecast given coordinates' do
    coordinates = MapquestFacade.coordinates('northampton,ma')
    location = ForecastFacade.forecast(coordinates.lat, coordinates.lng)

    expect(location).to be_a(Forecast)
    expect(location.current_weather).to be_a(CurrentWeather)
    expect(location.daily_weather).to be_a(DailyWeather)
    expect(location.hourly_weather).to be_an(HourlyWeather)
  end
end
