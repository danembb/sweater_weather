class MapquestService
  class << self
    def get_coordinates(location)
      response = BaseService.conn('http://mapquestapi.com').get("/geocoding/v1/address?location=#{location}") do |req|
        req.params["key"] = ENV["mapquest_api_key"]
      end
      BaseService.parse_json(response)
    end
  end
end
