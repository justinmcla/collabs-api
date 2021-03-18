class SocialLinkSerializer
  include JSONAPI::Serializer
  attributes :provider, :handle
end
