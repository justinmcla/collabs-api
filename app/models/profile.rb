class Profile < ApplicationRecord
  belongs_to :user
  has_one :location
  has_many :social_links

  # VALIDATIONS
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
end
