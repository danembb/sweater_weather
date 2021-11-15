class BoredFacade
  class << self
    def get_activity(type)
      activity = BoredService.get_activity(type)
      poro = Activity.new(activity)
    end
  end
end
