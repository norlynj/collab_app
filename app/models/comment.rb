class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # Validations
  validates :note, presence: true

  # Returns comments associated with a specific user
  def self.find_comments_by_user(user)
    where(user: user)
  end
end
