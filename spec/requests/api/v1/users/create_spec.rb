require 'rails_helper'


RSpec.describe 'create user endpoint', type: :request do
  describe 'happy path' do
    it 'can create a user', :vcr do
      body = {
              "email": "tinycatsneezes@example.com",
              "password": "password1",
              "password_confirmation": "password1"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/users', headers: headers, params: body, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(201)

      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(confirmation).to have_key(:data)
      expect(confirmation[:data]).to be_a(Hash)
      expect(confirmation[:data][:type]).to eq("users")

      expect(confirmation[:data]).to have_key(:attributes)
      expect(confirmation[:data][:attributes]).to have_key(:email)
      expect(confirmation[:data][:attributes]).to have_key(:api_key)
    end
  end
  describe 'sad paths' do
    it 'can return an error if a parameter is missing', :vcr do
      body = {
              "email": "tinycatsneezes@example.com",
              "password": "password1",
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/users', headers: headers, params: body, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error[:error]).to eq("Invalid field")
    end

    it 'can return an error if passwords do not match', :vcr do
      body = {
              "email": "tinycatsneezes@example.com",
              "password": "password1",
              "password_confirmation": "password2"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/users', headers: headers, params: body, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error[:error]).to eq("Invalid parameters")
    end

    xit 'can return an error if user already exists', :vcr do
      user = User.create(email: "tinycatsneezes@example.com", password_digest: "wow", api_key: "123-345-4567q")

      body = {
              "email": "tinycatsneezes@example.com",
              "password": "password",
              "password_confirmation": "password"
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

      post '/api/v1/users', headers: headers, params: body, as: :json

      expect(response).to_not be_successful
      expect(response.status).to be(400)
    end
  end
end
