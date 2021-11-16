class Api::V1::BackgroundsController < ApplicationController

  def index
    if params[:location] && !params[:location].nil?
      image = UnsplashFacade.get_background_image(params[:location])
      render json: BackgroundSerializer.new_background(image), status: :ok
    else
      render json: { error: "bad request" }, status: :bad_request
    end
  end
end
