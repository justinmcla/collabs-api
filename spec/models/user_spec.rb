require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a subscriber id' do
    user = User.new(sub: 'some_id')
    expect(user).to be_valid
  end
end
