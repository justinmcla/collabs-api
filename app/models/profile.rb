class Profile < ApplicationRecord
  belongs_to :user

  # VALIDATIONS
  validates :name, presence: true

  # POLYMORPHIC ASSOCIATIONS
  has_many :locations, as: :locatable
  has_many :jobs, as: :jobable
  has_many :educations, as: :educatable
  has_many :social_links, as: :linkable
  has_many :languages, as: :languageable
  
end
