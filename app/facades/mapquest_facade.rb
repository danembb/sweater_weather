class MapquestFacade
  class << self
    def coordinates(location)
      response = MapquestService.get_coordinates(location)
      if response && response[:results][0][:locations].empty?
        return 'No location provided'
      else
        location_data = response[:results].first[:locations].first[:latLng]
        Location.new(location_data)
      end
    end
  end
end
