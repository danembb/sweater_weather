require 'rails_helper'


RSpec.describe 'create user endpoint', :vcr do
  it 'can create a user' do

    body = {
            "email": "beans@example.com",
            "password": "password1",
            "password_confirmation": "password1"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }
    post '/api/v1/users', headers: headers, params: body, as: :json
  end
end
