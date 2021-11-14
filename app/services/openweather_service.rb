class OpenweatherService
  class << self
    def get_forecast(lat, lng)
      response = BaseService.conn('https://api.openweathermap.org').get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exclude=minutely,alerts&units=imperial") do |req|
        req.params["appid"] = ENV["openweather_api_key"]
      end
      BaseService.parse_json(response)
    end


    private

    def conn
      Faraday.new('')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
