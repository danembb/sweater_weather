class UnsplashService
  class << self
    def get_image(search_param)
      response = BaseService.conn('https://api.unsplash.com').get("/search/photos/?query=#{search_param}") do |req|
        req.params["client_id"] = ENV["unsplash_key"]
        req.params["page"] = 1
        req.params["per_page"] = 1
        req.params["content_filter"] = "high"
        req.params["orientation"] = "landscape"
        req.params["order_by"] = "relevant"
      end
      BaseService.parse_json(response)
    end
  end
end
