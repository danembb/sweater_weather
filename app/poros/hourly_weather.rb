class HourlyWeather

  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.zone.at(data[0][:dt])
    @temperature = data[0][:temp]
    @conditions = data[0][:weather][0][:description]
    @icon = data[0][:weather][0][:icon]
  end
end
