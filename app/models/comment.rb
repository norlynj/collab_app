class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # Validations
  validates :note, presence: true

  # Other methods and logic for the Comment model can be defined here
end
