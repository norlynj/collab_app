require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a label' do
      association = described_class.reflect_on_association(:label)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many comments' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many update logs' do
      association = described_class.reflect_on_association(:update_logs)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many assignments' do
      association = described_class.reflect_on_association(:assignments)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many assigned users' do
      association = described_class.reflect_on_association(:assigned_users)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:assignments)
      expect(association.options[:source]).to eq(:user)
    end
  end

  describe 'validations' do
    it 'validates presence of title' do
      task = Task.new(description: 'Sample description')
      expect(task).to be_invalid
      expect(task.errors[:title]).to include("can't be blank")
    end

    it 'validates presence of description' do
      task = Task.new(title: 'Sample title')
      expect(task).to be_invalid
      expect(task.errors[:description]).to include("can't be blank")
    end
  end

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
