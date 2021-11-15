class Api::V1::ActivitiesController < ApplicationController

  def index
    if params[:destination]
      destination = params[:destination]
      coordinates = MapquestFacade.coordinates(destination)
      forecast = ForecastFacade.forecast(coordinates.lat, coordinates.lng)
      relaxation_activity = BoredFacade.get_activity("relaxation")
      temp_based_activity = BoredFacade.get_temperature_activity(forecast.current_weather.temperature)
      render json: ActivitiesSerializer.new(forecast, destination, relaxation_activity, temp_based_activity)
    else
      render json: { error: "bad request" }, status: :bad_request
    end
  end
end
