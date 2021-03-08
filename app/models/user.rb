class User < ApplicationRecord
  before_validation :generate_uuid

  validates :sub, presence: true, uniqueness: true
  validates :uuid, presence: true, uniqueness: true

  has_one :profile

  private

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
