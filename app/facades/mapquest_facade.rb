class MapquestFacade
  class << self
    def coordinates(location)
      response = MapquestService.get_coordinates(location)
      location_data = response[:results].first[:locations].first[:latLng]

      Location.new(location_data)
    end

    def directions(start_loc, end_loc)
      response = MapquestService.get_route(start_loc, end_loc)
      time = response[:route]
      lat = MapquestFacade.coordinates(end_loc).lat
      lng = MapquestFacade.coordinates(end_loc).lng
      forecast = ForecastFacade.destination_weather(lat, lng)

      RoadTrip.new(time, forecast)
    end
  end
end
