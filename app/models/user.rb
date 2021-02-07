class User < ApplicationRecord
  validates :sub, presence: true
end
