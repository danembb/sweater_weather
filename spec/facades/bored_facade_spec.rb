require 'rails_helper'

RSpec.describe 'bored facade' do
  it 'can return an activity given a type', :vcr do
    activity = BoredFacade.get_activity("relaxation")

    expect(activity).to be_an(Activity)
    expect(activity.activity).to be_a(String)
    expect(activity.type).to be_a(String)
    expect(activity.participants).to be_a(Numeric)
    expect(activity.price).to be_a(Numeric)
  end

  it 'can return a recreational activity given a high temperature', :vcr do
    high_temp = 70
    border_temp = 60
    high_temp_activity = BoredFacade.get_temperature_activity(high_temp)
    border_temp_activity = BoredFacade.get_temperature_activity(border_temp)

    expect(high_temp_activity).to be_an(Activity)
    expect(high_temp_activity.type).to eq("recreational")

    expect(border_temp_activity).to be_an(Activity)
    expect(border_temp_activity.type).to eq("recreational")
  end

  it 'can return a busywork activity given a mid temperature', :vcr do
    mid_temp = 55
    border_temp = 50
    mid_temp_activity = BoredFacade.get_temperature_activity(mid_temp)
    border_temp_activity = BoredFacade.get_temperature_activity(border_temp)

    expect(mid_temp_activity).to be_an(Activity)
    expect(mid_temp_activity.type).to eq("busywork")

    expect(border_temp_activity).to be_an(Activity)
    expect(border_temp_activity.type).to eq("busywork")
  end

  it 'can return a cooking activity given a low temperature', :vcr do
    low_temp = 40
    low_temp_activity = BoredFacade.get_temperature_activity(low_temp)

    expect(low_temp_activity).to be_an(Activity)
    expect(low_temp_activity.type).to eq("cooking")
  end
end
