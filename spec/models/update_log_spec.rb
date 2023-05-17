require 'rails_helper'

RSpec.describe UpdateLog, type: :model do
  describe 'validations' do
    it 'validates presence of message' do
      update_log = UpdateLog.new
      update_log.valid?
      expect(update_log.errors[:message].any?).to be_falsy
    end
  end

  describe 'associations' do
    it 'belongs to a task' do
      association = UpdateLog.reflect_on_association(:task)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a user' do
      association = UpdateLog.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
