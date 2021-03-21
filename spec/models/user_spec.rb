require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a subscriber id' do
    user = User.new(sub: 'some_id')
    expect(user).to be_valid
  end
  it 'is not valid without a subscriber id' do
    user = User.new
    expect(user).to_not be_valid
  end
  it 'has no profile to begin with' do
    user = User.new(sub: 'some_id')
    expect(user.profile).to eq nil
  end
  it 'can have 1 profile' do
    user = User.new
    user.build_profile(name: Faker::Name.name)
    expect(user.profile).to_not eq nil
  end
  it 'can only have 1 profile' do
    user = User.new 
    user.build_profile(name: Faker::Name.name)
    user.build_profile(name: Faker::Name.name)
    expect(user.profile.class).to_not eq Array
  end 
  pending "add some examples to (or delete) #{__FILE__}"
end