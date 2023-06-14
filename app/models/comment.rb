class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # Validations
  validates :note, presence: true

  def self.find_comments_by_user(user)
    where(user: user)
  end
end
