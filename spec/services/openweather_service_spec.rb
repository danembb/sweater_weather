require 'rails_helper'

RSpec.describe 'openweather service' do
  it 'can get forecast data given coordinates', :vcr do
    response = OpenweatherService.get_forecast(42.31952, -72.629756)
    current_weather = response[:current][:weather][0]

    expect(response).to be_a(Hash)
    expect(response).to have_key(:current)
    expect(response).to have_key(:daily)
    expect(response).to have_key(:hourly)
    expect(current_weather[:id]).to be_an(Integer)
    expect(current_weather[:description]).to be_a(String)
  end
end
