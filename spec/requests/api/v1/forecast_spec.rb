require 'rails_helper'

RSpec.describe 'create forecast endpoint', type: :request do
  describe 'happy paths' do
    it 'can return a forecast given parameters', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecasts = JSON.parse(response.body, symbolize_names: true)

      expect(forecasts).to be_a(Hash)
      expect(forecasts[:data][:attributes][:current_weather].class).to eq(Hash)
      expect(forecasts[:data][:attributes][:daily_weather].class).to eq(Array)
      expect(forecasts[:data][:attributes][:hourly_weather].class).to eq(Array)
      expect(forecasts[:data][:attributes][:daily_weather].size).to eq(5)
      expect(forecasts[:data][:attributes][:hourly_weather].size).to eq(8)
    end
  end

  describe 'sad paths' do
    it 'can return an error when missing parameters', :vcr do
      get '/api/v1/forecast'

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
