require 'rails_helper'

RSpec.describe 'create road trips endpoint', type: :request do
  describe 'happy paths' do
    it 'can return a road trip upon authentication', :vcr do
      user = User.create(email: "tinycatsneezes@example.com", password: "wow", api_key: "123-345-4567q")

      body = {
        "origin": "northampton,ma",
        "destination": "lakewood,co",
        "api_key": user.api_key
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: body, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(200)

      trip = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(trip).to have_key(:id)
      expect(trip[:id]).to be_nil

      expect(trip).to have_key(:type)
      expect(trip[:type]).to eq('road_trip')

      expect(trip).to have_key(:attributes)
      expect(trip[:attributes]).to be_a(Hash)

      attributes = trip[:attributes]

      expect(attributes).to have_key(:start_city)
      expect(attributes[:start_city]).to be_a(String)

      expect(attributes).to have_key(:end_city)
      expect(attributes[:end_city]).to be_a(String)

      expect(attributes).to have_key(:travel_time)
      expect(attributes[:travel_time]).to be_a(String)

      expect(attributes).to have_key(:weather_at_eta)
      expect(attributes[:weather_at_eta]).to be_a(Hash)

      weather = attributes[:weather_at_eta]

      expect(weather).to have_key(:temperature)
      expect(weather[:temperature]).to be_a(Numeric)

      expect(weather).to have_key(:conditions)
      expect(weather[:conditions]).to be_a(String)
    end

    it 'can return partial road trip information given an impossible trip', :vcr do
      user = User.create(email: "tinycatsneezes@example.com", password: "wow", api_key: "123-345-4567q")

      body = {
        "origin": "northampton,ma",
        "destination": "London,uk",
        "api_key": user.api_key
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: body, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(200)

      trip = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(trip).to have_key(:id)
      expect(trip[:id]).to be_nil

      expect(trip).to have_key(:type)
      expect(trip[:type]).to eq('road_trip')

      expect(trip).to have_key(:attributes)
      expect(trip[:attributes]).to be_a(Hash)

      attributes = trip[:attributes]

      expect(attributes).to have_key(:start_city)
      expect(attributes[:start_city]).to be_a(String)

      expect(attributes).to have_key(:end_city)
      expect(attributes[:end_city]).to be_a(String)

      expect(attributes).to have_key(:travel_time)
      expect(attributes[:travel_time]).to be_a(String)
      expect(attributes[:travel_time]).to eq('impossible')

      expect(attributes).to have_key(:weather_at_eta)
      expect(attributes[:weather_at_eta]).to be_a(Hash)
      expect(attributes[:weather_at_eta]).to be_empty
    end
  end

  describe 'sad paths' do
    it 'can return unauthorized user if invalid key', :vcr do
      user = User.create(email: "tinycatsneezes@example.com", password: "wow", api_key: "123-345-4567q")


     body = {
       "origin": "Denver,CO",
       "destination": "Pueblo,CO",
       "api_key": "loafonthekeyboard"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: body, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      trip = JSON.parse(response.body, symbolize_names: true)

      expect(trip[:error]).to eq("Invalid credentials")
    end
  end
end
