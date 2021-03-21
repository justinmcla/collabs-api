# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Creates n users with randomly generated subscriber identities
10.times { User.create(sub: "seed_data | #{SecureRandom.uuid}") }

# Create randomly generated profile for each user
User.all.each do |user|
  profile_data = {
    name: Faker::Name.name,
    birthdate: Faker::Date.in_date_period(year: 2000),
    about: Faker::Lorem.paragraph,
    url: Faker::Internet.slug,
    profession: Faker::Job.title,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    facebook: Faker::Internet.username,
    github: Faker::Internet.username,
    instagram: Faker::Internet.username,
    linkedin: Faker::Internet.username,
    medium: Faker::Internet.username,
    twitter: Faker::Internet.username,
    youtube: Faker::Internet.username,
    twitch: Faker::Internet.username
  }
  user.create_profile(profile_data) unless user.profile

end

User.all.each do |user|
  post_data = {
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraphs.join(' '),
    author: user
  }
  Post.create(post_data)
end