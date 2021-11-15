require 'rails_helper'

RSpec.describe 'bored facade' do
  it 'can return an activity given a type' do
    activity = BoredFacade.get_activity("relaxation")

    expect(activity).to be_an(Activity)
    expect(activity.activity).to be_a(String)
    expect(activity.type).to be_a(String)
    expect(activity.participants).to be_a(Numeric)
    expect(activity.price).to be_a(Numeric)
  end
end
