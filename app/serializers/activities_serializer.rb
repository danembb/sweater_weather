class ActivitiesSerializer
  def self.new(forecast, destination, relaxation_activity, temp_based_activity)
    {
      "data": {
        "id": "null",
        "type": "activities",
        "attributes": {
          "destination": destination,
          "forecast": {
            "summary": forecast.current_weather.conditions,
            "temperature": forecast.current_weather.temperature.round(0).to_s + " F"
          },
          "activities": [
              {"title": temp_based_activity.activity,
              "type": temp_based_activity.type,
              "participants": temp_based_activity.participants,
              "price": temp_based_activity.price},
              {"title": relaxation_activity.activity,
              "type": relaxation_activity.type,
              "participants": relaxation_activity.participants,
              "price": relaxation_activity.price}
            ]
          }
        }
      }
  end
end
