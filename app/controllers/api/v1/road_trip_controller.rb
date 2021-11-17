class Api::V1::RoadTripController < ApplicationController

  def create
    if User.find_by(api_key: trip_params[:api_key])
      road_trip = MapquestFacade.trip(trip_params[:origin], trip_params[:destination])
      render json: RoadTripSerializer.new(road_trip), status: 200
    else
      render json: { error: 'Invalid credentials' }, status: :bad_request
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
