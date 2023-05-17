class Task < ApplicationRecord
  belongs_to :user
  belongs_to :label
  has_many :comments
  has_many :update_logs
  has_many :assignments
  has_many :assigned_users, through: :assignments, source: :user

  # Validations
  validates :title, presence: true
  validates :description, presence: true

  # Other methods and logic for the Task model can be defined here
end
