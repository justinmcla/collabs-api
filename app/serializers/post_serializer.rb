class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :content, :created_at
  attribute :author do |object|
    profile = object.author.profile
    {
      name: profile.name,
      location: profile.location,
      url: profile.url
    }
  end
end
