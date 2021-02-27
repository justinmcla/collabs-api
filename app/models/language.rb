class Language < ApplicationRecord
  belongs_to :languageable, polymorphic: true
end
