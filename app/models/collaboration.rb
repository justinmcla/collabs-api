class Collaboration < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  scope :accepted, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: nil) }
end
