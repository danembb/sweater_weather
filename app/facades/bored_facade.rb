class BoredFacade
  class << self
    def get_activity(type)
      activity = BoredService.get_activity(type)
      Activity.new(activity)
    end

    def get_temperature_activity(temp)
      if temp >= 60
        activity = BoredService.get_activity("recreational")
      elsif temp >= 50 && temp < 60
        activity = BoredService.get_activity("busywork")
      elsif temp < 50
        activity = BoredService.get_activity("cooking")
      end
      Activity.new(activity)
    end
  end
end
