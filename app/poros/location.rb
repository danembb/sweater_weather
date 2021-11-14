class Location

  attr_reader :lat,
              :long

  def initialize(data)
    @lat = data[:lat]
    @lng = data[:lng]
  end
end
