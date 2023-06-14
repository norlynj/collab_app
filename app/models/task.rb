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

  def update_status(status)
    update(status: status)
  end

  def update_name_description(name, description)
    update(name: name, description: description)
  end

  def assign_member(member)
    assigned_users << member
  end

  def add_comment(user, note)
    comments.create(user: user, note: note)
  end

  def add_update_log(user, note)
    update_logs.create(user: user, note: note)
  end

  def comments_by_user(user)
    comments.where(user: user)
  end

  def update_status!(status)
    update!(status: status)
    add_update_log("Task status updated to #{status}.")
  end
end
