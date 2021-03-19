class User < ApplicationRecord
  before_validation :generate_uuid

  validates :sub, presence: true, uniqueness: true
  validates :uuid, presence: true, uniqueness: true

  has_one :profile
  has_many :collaborations_as_sender, class_name: "Collaboration", foreign_key: "sender_id"
  has_many :collabs_as_sender, -> { where(collaborations: { accepted: true }) }, through: :collaborations_as_sender, source: :receiver
  has_many :collaborations_as_receiver, class_name: "Collaboration", foreign_key: "receiver_id"
  has_many :collabs_as_receiver, -> { where(collaborations: { accepted: true }) }, through: :collaborations_as_receiver, source: :sender

  def collabs
    ids = collabs_as_receiver.pluck(:id).concat(collabs_as_sender.pluck(:id))
    User.where(id: ids)
  end

  def pending_collaborations
    collaborations_as_sender.pending.map{|collaboration| collaboration.receiver} + collaborations_as_receiver.pending.map{|collaboration| collaboration.sender}
  end

  private

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
