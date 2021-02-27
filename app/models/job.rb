class Job < ApplicationRecord
  belongs_to :jobable, polymorphic: true
end
