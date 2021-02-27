class User < ApplicationRecord
  validates :sub, presence: true, uniqueness: true

  has_one :profile
end
