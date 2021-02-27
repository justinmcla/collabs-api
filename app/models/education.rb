class Education < ApplicationRecord
  belongs_to :educatable, polymorphic: true
end
