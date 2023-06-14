class Deadline < ApplicationRecord
  belongs_to :task

  # Validations
  validates :date, presence: true

  def self.find_due_soon(deadline_limit)
    where("date <= ?", deadline_limit)
  end
end