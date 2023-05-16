class Task < ApplicationRecord
  belongs_to :user
  has_one :label
  has_many :comments
  has_many :update_logs

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true

  # Other methods and logic for the Task model can be defined here
end
