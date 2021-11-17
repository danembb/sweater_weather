require 'rails_helper'

RSpec.describe 'mapquest facade', :vcr do
  it 'can return the latitude and longitude given a location', :vcr do
    location = MapquestFacade.coordinates('northampton,ma')
    expect(location).to be_a(Location)
  end

  it 'can return directions given a routes start and end locations', :vcr do
    route = MapquestFacade.directions('northampton,ma', 'lakewood,co')

    expect(route).to be_a(RoadTrip)
  end
end
