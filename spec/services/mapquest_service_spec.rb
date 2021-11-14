require 'rails_helper'

RSpec.describe 'mapquest service' do
  it 'can return latitude and longitude data given a location', :vcr do
    response = MapquestService.get_coordinates('northampton,ma')
    coordinates = response[:results][0][:locations][0][:latLng]

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(coordinates).to have_key(:lat)
    expect(coordinates).to have_key(:lng)
    expect(coordinates[:lat]).to eq(42.31952)
    expect(coordinates[:lng]).to eq(-72.629756)
  end
end
