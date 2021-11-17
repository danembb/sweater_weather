class RoadTrip

  attr_reader :travel_time,
              :temperature,
              :conditions
  def initialize(time, forecast)
  @travel_time = time[:formatted_time]
  @temperature = forecast[:temperature]  ???
  @conditions = forecast[:conditions] ???
  end
end
