require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'validates the presence of name' do
      user = User.new
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates the presence of email' do
      user = User.new
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    # Add more validation tests here
  end
end
