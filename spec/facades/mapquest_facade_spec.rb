require 'rails_helper'

RSpec.describe 'mapquest facade', :vcr do
  it 'can return the latitude and longitude for a given location', :vcr do
    location = MapquestFacade.coordinates('northampton,ma')
    expect(location).to be_a(Location)
  end

  it 'can return an error if given no location', :vcr do
    location = MapquestFacade.coordinates('')
    expected = 'No location provided'
    expect(location).to eq(expected)
  end
end
