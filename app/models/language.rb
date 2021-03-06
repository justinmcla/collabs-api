class Language < ApplicationRecord
  belongs_to :languageable, polymorphic: true

  validates :lang, presence: true
  validates :proficiency, presence: true
  validates :proficiency, inclusion: { 
    in: %w(Beginner Advanced Fluent),
    message: "%{value} is not a valid option"
  }
end
