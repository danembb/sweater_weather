class MapquestService
  class << self
    def get_coordinates(location)
      response = BaseService.conn('http://mapquestapi.com').get("/geocoding/v1/address?location=#{location}") do |req|
        req.params["key"] = ENV["mapquest_api_key"]
      end
      parsed = BaseService.parse_json(response)
    end

    def get_route(start_loc, end_loc)
      response = BaseService.conn('http://www.mapquestapi.com').get("/directions/v2/route?from=#{start_loc}&to=#{end_loc}") do |req|
        req.params["key"] = ENV["mapquest_api_key"]
      end
      parsed = BaseService.parse_json(response)
    end
  end
end
