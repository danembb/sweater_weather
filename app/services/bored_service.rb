class BoredService
  class << self
    def get_relaxation_activity
      response = BaseService.conn('http://www.boredapi.com').get("/api/activity?type=relaxation")
      BaseService.parse_json(response)
    end
  end
end
