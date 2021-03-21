class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :content, :created_at
  attribute :author do |object|
    object.author.profile
  end
end
