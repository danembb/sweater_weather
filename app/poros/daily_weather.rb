class DailyWeather

  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.zone.at(data[:dt]).utc.to_s
    @sunrise = Time.zone.at(data[:sunrise]).utc.to_s
    @sunset = Time.zone.at(data[:sunset]).utc.to_s
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
