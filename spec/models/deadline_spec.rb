require 'rails_helper'

RSpec.describe Deadline, type: :model do
  describe 'associations' do
    it 'belongs to a task' do
      association = described_class.reflect_on_association(:task)
      expect(association).not_to be_nil
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    it 'validates presence of due_date' do
      deadline = Deadline.new
      deadline.valid?
      expect(deadline.errors[:due_date].any?).to be_falsy
    end
  end
end
