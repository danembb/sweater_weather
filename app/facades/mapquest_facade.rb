class MapquestFacade
  class << self
    def coordinates(location)
      response = MapquestService.get_coordinates(location)
      location_data = response[:results].first[:locations].first[:latLng]

      Location.new(location_data)
    end

    def trip(origin, destination)
      response = MapquestService.get_route(origin, destination)
      @lat = MapquestFacade.coordinates(destination).lat
      @lng = MapquestFacade.coordinates(destination).lng

      trip = {
              start_city: origin,
              end_city: destination,
              time: response[:route][:time],
              weather: ForecastFacade.forecast(@lat, @lng)
      }

      RoadTrip.new(trip)
    end
  end
end
