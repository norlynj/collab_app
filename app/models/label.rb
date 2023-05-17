class Label < ApplicationRecord

  # Validations
  validates :tag, presence: true, uniqueness: true

  # Other methods and logic for the Label model can be defined here
end