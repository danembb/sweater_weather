require 'rails_helper'

RSpec.describe 'create sessions endpoint', type: :request do
  describe 'happy paths' do
    it 'can return a user upon authentication', :vcr do
      user = User.create(email: "tinycatsneezes@example.com", password: "wow", api_key: "123-345-4567q")

      login = {
              email: "tinycatsneezes@example.com",
              password: "wow"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/sessions', headers: headers, params: login, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(200)

      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(confirmation.class).to eq(Hash)
      expect(confirmation[:data].class).to eq(Hash)
      expect(confirmation[:data][:id]).to eq(user.id)
      expect(confirmation[:data][:attributes].size).to eq(2)
      expect(confirmation[:data][:attributes][:email]).to eq(user.email)
      expect(confirmation[:data][:attributes][:api_key]).to eq(user.api_key)
    end
  end

  describe 'sad paths' do
    it 'can return an error given an invalid email', :vcr do
      user = User.create(email: "tinycatsneezes@example.com", password: "wow", api_key: "123-345-4567q")

      login = {
              email: "primordialpouch@whatdoesitmean.com",
              password: "wow"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/sessions', headers: headers, params: login, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end

    it 'can return an error given an invalid password', :vcr do
      user = User.create(email: "tinycatsneezes@example.com", password: "wow", api_key: "123-345-4567q")

      login = {
              email: "tinycatsneezes@example.com",
              password: "woah"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/sessions', headers: headers, params: login, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
