require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#notify_deadline' do
    let(:user) { create(:user) }
    let(:task) { create(:task, user: user, due_date: 2.days.from_now) }

    it 'enqueues a deadline notification job when due date is within 3 days' do
      expect {
        task.notify_deadline
      }.to have_enqueued_job(DeadlineNotificationJob).with(task)
    end

    it 'does not enqueue a deadline notification job when due date is not within 3 days' do
      task.update(due_date: 4.days.from_now)

      expect {
        task.notify_deadline
      }.not_to have_enqueued_job(DeadlineNotificationJob)
    end
  end
end
