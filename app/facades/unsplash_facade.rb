class UnsplashFacade
  class << self
    def get_background_image(search_param)
      response = UnsplashService.get_image(search_param)
      results = response[:results].first
      BackgroundImage.new(results)
    end
  end
end
