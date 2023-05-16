class User < ApplicationRecord
  has_many :tasks
  has_many :comments
  has_many :update_logs

  # Validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }

  # Other methods and logic for the User model can be defined here
end
