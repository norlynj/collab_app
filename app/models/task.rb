class Task < ApplicationRecord
  belongs_to :user
  belongs_to :label
  has_one :deadline
  has_many :comments
  has_many :update_logs

  # Validations
  validates :title, presence: true
  validates :description, presence: true

  # Notifies the deadline if it's within 3 days
  def notify_deadline
    if due_date.present? && (due_date - Date.today).to_i <= 3
      # Enqueue a background job to handle the notification
      DeadlineNotificationJob.perform_later(self)
    end
  end

  # Updates the task status
  def update_status(status)
    update(status: status)
  end

  # Updates the task name and description
  def update_name_description(name, description)
    update(name: name, description: description)
  end

  # Assigns a member to the task
  def assign_member(member)
    assigned_users << member
  end

  # Adds a comment to the task
  def add_comment(user, note)
    comments.create(user: user, note: note)
  end

  # Adds an update log to the task
  def add_update_log(user, note)
    update_logs.create(user: user, note: note)
  end

  # Retrieves comments by a specific user
  def comments_by_user(user)
    comments.where(user: user)
  end

  # Updates the task status and adds an update log
  def update_status!(status)
    update!(status: status)
    add_update_log("Task status updated to #{status}.")
  end
end
