class OpenweatherService
  class << self
    def get_forecast(lat, lng)
      response = BaseService.conn('https://api.openweathermap.org').get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exclude=minutely,alerts&units=imperial") do |req|
        req.params["appid"] = ENV["openweather_api_key"]
        req.params['units'] = 'imperial'
        req.params['exclude'] = 'minutely'
      end
      BaseService.parse_json(response)
    end
  end
end
