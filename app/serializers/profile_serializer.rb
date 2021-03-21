class ProfileSerializer
  include JSONAPI::Serializer
  attributes :id, :user_id, :name, :birthdate, :about, :url, :profession, 
    :image_url, :city, :state, :zip, :facebook, :twitter, :instagram, 
    :github, :linkedin, :medium, :twitter, :youtube, :twitch
  
  attribute :uuid do |object|
    object.user.uuid
  end
end