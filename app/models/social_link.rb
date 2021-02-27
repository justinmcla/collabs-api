class SocialLink < ApplicationRecord
  belongs_to :linkable, polymorphic: true
end
