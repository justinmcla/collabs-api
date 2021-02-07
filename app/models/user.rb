class User < ApplicationRecord
  validates :sub, presence: true

  has_one :profile
end
