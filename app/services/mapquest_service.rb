class MapquestService
  class << self
    def get_coordinates(location)
      response = conn.get("/geocoding/v1/address?location=#{location}") do |req|
        req.params["key"] = ENV["mapquest_api_key"]
      end
      parse_json(response)
    end


    private

    def conn
      Faraday.new('http://mapquestapi.com')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
