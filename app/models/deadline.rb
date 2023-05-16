class Deadline < ApplicationRecord
  belongs_to :task

  # Validations
  validates :date, presence: true

  # Other methods and logic for the Deadline model can be defined here
end