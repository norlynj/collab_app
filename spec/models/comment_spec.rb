require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'validates the presence of note' do
    comment = Comment.new
    comment.note = nil
    comment.valid?
    expect(comment.errors[:note]).to include("can't be blank")
  end

  it 'belongs to a task' do
    association = Comment.reflect_on_association(:task)
    expect(association.macro).to eq(:belongs_to)
  end
end

