require 'rails_helper'

RSpec.describe Activity do
  it 'exists and has attributes' do
    activity = {
                "activity": "Take a bubble bath",
                "type": "relaxation",
                "participants": 1,
                "price": 0.15,
                "link": "",
                "key": "2581372",
                "accessibility": 0.1
        }
    new_activity = Activity.new(activity)

    expect(new_activity).to be_an(Activity)
    expect(new_activity.activity).to eq("Take a bubble bath")
    expect(new_activity.type).to eq("relaxation")
    expect(new_activity.participants).to eq(1)
    expect(new_activity.price).to eq(0.15)
  end
end
