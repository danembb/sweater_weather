require 'rails_helper'

RSpec.describe 'create background endpoint', type: :request do
  describe 'happy paths' do
    it 'can return a forecast background given parameters', :vcr do

      get '/api/v1/backgrounds?location=denver,co'

      expect(response).to be_successful
      expect(response.status).to be(200)

      background = JSON.parse(response.body, symbolize_names: true)

      expect(background).to be_a(Hash)
      expect(background[:data][:attributes]).to be_a(Hash)
      expect(background[:data][:attributes].size).to eq(1)
    end
  end

  describe 'sad paths' do
    it 'can return an error when missing parameters', :vcr do
      get '/api/v1/backgrounds'

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
