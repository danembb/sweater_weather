require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has attributes', :vcr do
    origin = 'northampton,ma'
    destination = 'lakewood,co'

    directions = MapquestService.get_route(origin, destination)

    @lat = MapquestFacade.coordinates(destination).lat
    @lng = MapquestFacade.coordinates(destination).lng

    trip_data = {
      start_city: origin,
      end_city: destination,
      time: directions[:route][:time],
      weather: ForecastFacade.forecast(@lat, @lng)
    }

    trip = RoadTrip.new(trip_data)
    
    expect(trip.start_city).to eq('northampton,ma')
    expect(trip.end_city).to eq('lakewood,co')
    expect(trip.travel_time).to be_a(String)
    expect(trip.weather_at_eta).to be_a(Hash)
  end
end
