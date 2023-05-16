class Label < ApplicationRecord
  has_and_belongs_to_many :tasks

  # Validations
  validates :name, presence: true, uniqueness: true

  # Other methods and logic for the Label model can be defined here
end