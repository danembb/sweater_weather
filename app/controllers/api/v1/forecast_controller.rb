class Api::V1::ForecastController < ApplicationController

  def index
    if params[:location]
      coordinates = MapquestFacade.coordinates(params[:location])
      forecast = ForecastFacade.forecast(coordinates.lat, coordinates.lng)
      render json: ForecastSerializer.new(forecast), status: :ok
    else
      render json: { error: "bad request" }, status: :bad_request
    end
  end
end
