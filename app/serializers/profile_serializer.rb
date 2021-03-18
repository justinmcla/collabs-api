class ProfileSerializer
  include JSONAPI::Serializer
  attributes :name, :birthdate, :about, :url, :profession, :location, :social_links
  attribute :uuid do |object|
    "#{object.user.uuid}"
  end
end