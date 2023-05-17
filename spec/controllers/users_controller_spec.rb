# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { name: 'John Doe', email: 'john@example.com', password: 'password' } }
  let(:invalid_attributes) { { name: '', email: 'invalid_email', password: 'short' } }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it 'redirects to the user show page' do
        post :create, params: { user: valid_attributes }
        expect(response).to have_http_status(302)
      end

      it 'sets a flash notice message' do
        post :create, params: { user: valid_attributes }
        expect(flash[:notice]).to eq('User was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new user' do
        expect {
          post :create, params: { user: invalid_attributes }
        }.not_to change(User, :count)
      end

      it 'renders the user index page' do
        post :create, params: { user: invalid_attributes }
        expect(response).to redirect_to(users_path)
      end

      it 'sets a flash alert message' do
        post :create, params: { user: invalid_attributes }
        expect(flash[:alert]).to eq("Failed to create user.")
      end
    end
  end
end
