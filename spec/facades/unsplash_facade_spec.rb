require 'rails_helper'

RSpec.describe 'unsplash facade' do
  it 'can return a background image', :vcr do
    search_param = "northampton,ma"

    background_image = UnsplashFacade.get_background_image(search_param)

    expect(background_image).to be_a(BackgroundImage)
  end
end
