class MapquestService
  class << self
    def get_coordinates(location)
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
