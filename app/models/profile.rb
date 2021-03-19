class Profile < ApplicationRecord
  belongs_to :user
  has_one :location
  has_many :social_links
  has_one_attached :profile_picture

  # VALIDATIONS
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
end
