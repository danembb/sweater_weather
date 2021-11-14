require 'rails_helper'

RSpec.describe 'mapquest facade', :vcr do
  #happy path
  it 'can return the latitude and longitude given a location', :vcr do
    location = MapquestFacade.coordinates('northampton,ma')
    expect(location).to be_a(Location)
  end

  #sad path
  it 'can return an error given no location', :vcr do
    location = MapquestFacade.coordinates('')
    expected = 'No location provided'
    expect(location).to eq(expected)
  end
end
