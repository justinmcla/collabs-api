class LocationSerializer
  include JSONAPI::Serializer
  attributes :city, :state, :zip
end
