class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture

  # VALIDATIONS
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true

  def image_url
    Rails.application.routes.url_helpers.url_for(profile_picture) if profile_picture.attached?
  end

end
