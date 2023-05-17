# spec/controllers/deadlines_controller_spec.rb
require 'rails_helper'

RSpec.describe DeadlinesController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:valid_attributes) { { task_id: task.id, due_date: Date.tomorrow } }
  let(:invalid_attributes) { { task_id: task.id, due_date: Date.yesterday } }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new deadline' do
        expect {
          post :create, params: { deadline: valid_attributes }
        }.to change(Deadline, :count).by(1)
      end

      it 'redirects to the task show page' do
        post :create, params: { deadline: valid_attributes }
        expect(response).to redirect_to(task)
      end

      it 'sets a flash notice message' do
        post :create, params: { deadline: valid_attributes }
        expect(flash[:notice]).to eq('Deadline was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new deadline' do
        expect {
          post :create, params: { deadline: invalid_attributes }
        }.not_to change(Deadline, :count)
      end

      it 'renders the task show page' do
        post :create, params: { deadline: invalid_attributes }
        expect(response).to render_template('tasks/show')
      end

      it 'sets a flash alert message' do
        post :create, params: { deadline: invalid_attributes }
        expect(flash[:alert]).to eq("Failed to create deadline. Due date can't be in the past.")
      end
    end
  end
end
