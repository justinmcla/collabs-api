class Job < ApplicationRecord
  belongs_to :jobable, polymorphic: true

  validates :title, presence: true
  validates :employer, presence: true

  has_one :location, as: :locatable
end
