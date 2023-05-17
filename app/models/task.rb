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

  def notify_deadline
    if due_date.present? && (due_date - Date.today).to_i <= 3
      # Enqueue a background job to handle the notification
      DeadlineNotificationJob.perform_later(self)
    end
  end
end
