class Education < ApplicationRecord
  belongs_to :educatable, polymorphic: true

  validates :highest_level, presence: true
  validates :highest_level, inclusion: { 
    in: [
      'High School',
      'Some College', 
      'Associate\'s Degree',
      'Bachelor\'s Degree',
      'Master\'s Degree',
      'Doctoral Degree'
    ], message: "%{value} is not a valid option"
  }
  validates :institution, presence: true

  has_one :location, as: :locatable
end
