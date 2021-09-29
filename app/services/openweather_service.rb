class OpenweatherService
  class << self
    def get_forecast(lat, lon)
      response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,alerts&units=imperial") do |req|
        req.params["appid"] = ENV["openweather_api_key"]
      end
      parse_json(response)
    end


    private

    def conn
      Faraday.new('https://api.openweathermap.org')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
