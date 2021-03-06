class Job < ApplicationRecord
  belongs_to :jobable, polymorphic: true

  validates :title, presence: true
  validates :employer, presence: true

end
