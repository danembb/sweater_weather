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

  it 'can return route information given start and end locations', :vcr do
    response = MapquestService.get_route('northampton,ma', 'lakewood,co')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to be_a(Hash)
    expect(response[:route]).to have_key(:formattedTime)
    expect(response[:route]).to have_key(:locations)
    expect(response[:route][:locations]).to be_an(Array)
    expect(response[:route][:locations][0]).to have_key(:adminArea5)
    expect(response[:route][:locations][1]).to have_key(:adminArea5)
  end
end
