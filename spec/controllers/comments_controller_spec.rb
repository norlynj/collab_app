# spec/controllers/comments_controller_spec.rb
require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:valid_attributes) { { task_id: task.id, body: 'Comment body' } }
  let(:invalid_attributes) { { task_id: task.id, body: '' } }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new comment' do
        expect {
          post :create, params: { comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end

      it 'redirects to the task show page' do
        post :create, params: { comment: valid_attributes }
        expect(response).to redirect_to(task)
      end

      it 'sets a flash notice message' do
        post :create, params: { comment: valid_attributes }
        expect(flash[:notice]).to eq('Comment was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new comment' do
        expect {
          post :create, params: { comment: invalid_attributes }
        }.not_to change(Comment, :count)
      end

      it 'renders the task show page' do
        post :create, params: { comment: invalid_attributes }
        expect(response).to render_template('tasks/show')
      end

      it 'sets a flash alert message' do
        post :create, params: { comment: invalid_attributes }
        expect(flash[:alert]).to eq("Failed to create comment. Body can't be blank.")
      end
    end
  end
end
