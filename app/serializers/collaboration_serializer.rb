class CollaborationSerializer
  include JSONAPI::Serializer
  attributes :id, :accepted
  attribute :sender do |object|
    object.sender.profile
  end
  attribute :receiver do |object|
    object.receiver.profile
  end
end
