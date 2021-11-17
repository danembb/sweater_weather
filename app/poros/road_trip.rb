class RoadTrip

  attr_reader :start_city,
              :end_city,
              :total_time,
              :travel_time,
              :weather,
              :weather_at_eta

  def initialize(data)
  @start_city = data[:start_city]
  @end_city = data[:end_city]
  @total_time = data[:time]
  @weather = data[:weather]
  end

  def travel_time
    return 'impossible' if @total_time.nil?

    day = Time.at(@total_time).utc.day
    if day == 1
      Time.at(@total_time).utc.strftime('%k hours %M min')
    else
      "#{day - 1} days " + Time.at(@total_time).utc.strftime('%k hours %M min')
    end
  end

  def weather_at_eta
    return {} if @total_time.nil?

    hour = Time.at(@total_time).utc.hour
    day = Time.at(@total_time).utc.day
    if day == 1 && hour < 8
      {
        temperature: @weather.hourly_weather[hour].temperature,
        conditions: @weather.hourly_weather[hour].conditions
      }
    elsif day <= 5
      {
        temperature: @weather.daily_weather[day - 1].max_temp,
        conditions: @weather.daily_weather[day - 1].conditions
      }
    else
      'Forecasts beyond 5 days are unavailable'
    end
  end
end
