# spec/controllers/update_logs_controller_spec.rb
require 'rails_helper'

RSpec.describe UpdateLogsController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:valid_attributes) { { content: 'Sample update log content' } }
  let(:invalid_attributes) { { content: '' } }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new update log' do
        sign_in user

        expect {
          post :create, params: { task_id: task.id, update_log: valid_attributes }
        }.to change(UpdateLog, :count).by(1)
      end

      it 'redirects to the task show page' do
        sign_in user

        post :create, params: { task_id: task.id, update_log: valid_attributes }
        expect(response).to redirect_to(task)
      end

      it 'sets a flash notice message' do
        sign_in user

        post :create, params: { task_id: task.id, update_log: valid_attributes }
        expect(flash[:notice]).to eq('Update log was successfully added.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new update log' do
        sign_in user

        expect {
          post :create, params: { task_id: task.id, update_log: invalid_attributes }
        }.not_to change(UpdateLog, :count)
      end

      it 'renders the task show page' do
        sign_in user

        post :create, params: { task_id: task.id, update_log: invalid_attributes }
        expect(response).to render_template('tasks/show')
      end

      it 'sets a flash alert message' do
        sign_in user

        post :create, params: { task_id: task.id, update_log: invalid_attributes }
        expect(flash[:alert]).to eq('Failed to add update log.')
      end
    end
  end

end
