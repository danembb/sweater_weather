class MapquestService
  class << self
    def get_coordinates(location)
      response = BaseService.conn('http://mapquestapi.com').get("/geocoding/v1/address?location=#{location}") do |req|
        req.params["key"] = ENV["mapquest_api_key"]
      end
      parsed = BaseService.parse_json(response)
    end

    def get_route(origin, destination)
      response = BaseService.conn('http://www.mapquestapi.com').get("/directions/v2/route?from=#{origin}&to=#{destination}") do |req|
        req.params["key"] = ENV["mapquest_api_key"]
      end
      parsed = BaseService.parse_json(response)
    end
  end
end
