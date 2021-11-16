require 'rails_helper'

RSpec.describe 'unsplash service' do
  it 'can return an image given query params', :vcr do
    response = UnsplashService.get_image("Worcester,MA")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].first).to have_key(:urls)
    expect(response[:results].first[:urls]).to have_key(:full)
    expect(response[:results].first).to have_key(:user)
    expect(response[:results].first[:user]).to have_key(:username)
  end
end
