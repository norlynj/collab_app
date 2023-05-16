class UpdateLog < ApplicationRecord
  belongs_to :task
  belongs_to :user

  # Validations
  validates :description, presence: true

  # Other methods and logic for the UpdateLog model can be defined here
end