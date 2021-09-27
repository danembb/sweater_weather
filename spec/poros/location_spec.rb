require 'rails_helper'

RSpec.describe 'location' do
  it 'can return a location object given coordinates' do
    location_data = {
      "lat": 42.31952,
      "lng": -72.629756
    }

    northampton = Location.new(location_data)

    expect(northampton.lat).to eq(42.31952)
    expect(northampton.long).to eq(-72.629756)
  end
end
