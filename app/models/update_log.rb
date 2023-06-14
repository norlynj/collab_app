class UpdateLog < ApplicationRecord
  belongs_to :task
  belongs_to :user

  # Validations
  validates :note, presence: true

  def self.find_logs_by_task(task)
    where(task: task)
  end

  def self.find_logs_by_user(user)
    where(user: user)
  end

  def self.find_logs_by_task(task)
    where(task: task)
  end
end