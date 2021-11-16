class BackgroundImage
  attr_reader :id,
              :source,
              :logo,
              :description,
              :image_url,
              :user,
              :user_portfolio,
              :location

  def initialize(data)
    @id = "null"
    @source = "unsplash.com"
    @logo = "https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg"
    @description = data[:description]
    @image_url = data[:urls][:full]
    @user = data[:user][:username]
    @user_portfolio = data[:user][:portfolio_url]
    @location = data[:user][:location]
  end
end
