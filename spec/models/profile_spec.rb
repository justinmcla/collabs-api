require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'is valid with a user & name' do
    profile = Profile.new(user: User.new, name: Faker::Name.name)
    expect(profile).to be_valid
  end
  it 'is not valid without a user' do
    profile = Profile.new(name: Faker::Name.name)
    expect(profile).to_not be_valid
  end
  it 'is not valid without a name' do
    profile = Profile.new(user: User.new)
    expect(profile).to_not be_valid
  end 
end
