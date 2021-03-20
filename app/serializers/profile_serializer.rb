class ProfileSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :birthdate, :about, :url, :profession, :location, :social_links, :image_url
  attribute :uuid do |object|
    "#{object.user.uuid}"
  end
end