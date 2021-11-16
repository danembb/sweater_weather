class BackgroundSerializer
  class << self
    def new_background(image)
        {
          "data": {
          "type": "image",
          "id": image.id,
          "attributes": {
            "image": {
              "location": image.location,
              "image_url": image.image_url,
              "description": image.description,
              "credit": {
                "source": image.source,
                "user": image.user,
                "user portfolio": image.user_portfolio,
                "logo": image.logo
              }
            }
          }
        }
      }
    end
  end
end
