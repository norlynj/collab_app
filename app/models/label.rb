class Label < ApplicationRecord

  # Validations
  validates :tag, presence: true, uniqueness: true

  def self.find_tasks_by_label(label)
    find_by(tag: label).tasks
  end

  def self.find_tasks_by_status(status)
    joins(:tasks).where(tasks: { status: status })
  end
end