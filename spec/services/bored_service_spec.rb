require 'rails_helper'

RSpec.describe 'bored service' do
  it 'returns an activity' do
    response = BoredService.get_activity("relaxation")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:activity)
    expect(response).to have_key(:type)
    expect(response).to have_key(:participants)
    expect(response).to have_key(:price)
    expect(response).to have_key(:link)
    expect(response).to have_key(:key)
    expect(response).to have_key(:accessibility)
  end
end
