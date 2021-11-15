class BoredService
  class << self
    def get_activity(type)
      response = BaseService.conn('http://www.boredapi.com').get("/api/activity?type=#{type}")
      BaseService.parse_json(response)
    end
  end
end
