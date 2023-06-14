class UpdateLog < ApplicationRecord
  belongs_to :task
  belongs_to :user

  # Validations
  validates :note, presence: true

  # Returns update logs associated with a specific task
  def self.find_logs_by_task(task)
    where(task: task)
  end

  # Returns update logs associated with a specific user
  def self.find_logs_by_user(user)
    where(user: user)
  end
end
