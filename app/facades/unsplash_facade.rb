class UnsplashFacade
  class << self

    def get_background_image(search_param)
      response = UnsplashService.get_image(search_param)

      BackgroundImage.new(response[:results].first)
    end
  end
end
