require 'rails_helper'


RSpec.describe Label, type: :model do
  it 'validates the presence of tag' do
    label = Label.new
    label.tag = nil
    label.valid?
    expect(label.errors[:tag]).to include("can't be blank")
  end
end
