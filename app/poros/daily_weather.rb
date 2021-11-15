class DailyWeather

  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.zone.at(data[0][:dt])
    @sunrise = Time.zone.at(data[0][:sunrise])
    @sunset = Time.zone.at(data[0][:sunset])
    @max_temp = data[0][:temp][:max]
    @min_temp = data[0][:temp][:min]
    @conditions = data[0][:weather].first[:description]
    @icon = data[0][:weather].first[:icon]
  end
end
