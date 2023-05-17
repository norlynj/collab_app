# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:valid_attributes) { { title: 'Sample Task', description: 'Sample description' } }
  let(:invalid_attributes) { { title: '', description: 'Sample description' } }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new task' do
        sign_in user

        expect {
          post :create, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it 'redirects to the task show page' do
        sign_in user

        post :create, params: { task: valid_attributes }
        expect(response).to redirect_to(Task.last)
      end

      it 'sets a flash notice message' do
        sign_in user

        post :create, params: { task: valid_attributes }
        expect(flash[:notice]).to eq('Task was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new task' do
        sign_in user

        expect {
          post :create, params: { task: invalid_attributes }
        }.not_to change(Task, :count)
      end

      it 'renders the new task page' do
        sign_in user

        post :create, params: { task: invalid_attributes }
        expect(response).to render_template('new')
      end

      it 'sets a flash alert message' do
        sign_in user

        post :create, params: { task: invalid_attributes }
        expect(flash[:alert]).to eq("Failed to create task. Title can't be blank.")
      end
    end
  end

end
