class Api::V1::ActivitiesController < ApplicationController

  def index
    destination = MapquestFacade.coordinates(params[:destination])
    destination_forecast = ForecastFacade.forecast(destination.lat, destination.lng)
    current_weather = destination_forecast.current_weather
    temp = current_weather.temperature
    relaxation = BoredFacade.get_activity("relaxation")
    temp_based_activity = BoredFacade.get_temperature_activity(temp)
    require "pry"; binding.pry
  end
end
