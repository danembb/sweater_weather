class Api::V1::ActivitiesController < ApplicationController

  def index
    destination = MapquestFacade.get_coordinates(params[:location])
    destination_forecast = ForecastFacade.forecast(destination.lat, destination.lng)
    # this will be with ActivitySerializer --> will borrow forecast 
    # render json: ActivitySerializer.new(forecast)
  end
end
