class Api::V1::ActivitiesController < ApplicationController

  def index
    destination = MapquestFacade.coordinates(params[:destination])
    destination_forecast = ForecastFacade.current_forecast(destination.lat, destination.lng)
    require "pry"; binding.pry
    relaxation = BoredFacade.get_activity("relaxation")

    temp_based_activity = BoredFacade.get_activity()
    # this will be with ActivitySerializer --> will borrow forecast
    # render json: ActivitySerializer.new(forecast)
  end
end
