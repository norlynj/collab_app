# spec/controllers/labels_controller_spec.rb
require 'rails_helper'

RSpec.describe LabelsController, type: :controller do
  let(:user) { create(:user) }
  let(:label) { create(:label, user: user) }
  let(:valid_attributes) { { name: 'Label Name' } }
  let(:invalid_attributes) { { name: '' } }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new label' do
        expect {
          post :create, params: { label: valid_attributes }
        }.to change(Label, :count).by(1)
      end

      it 'redirects to the labels index page' do
        post :create, params: { label: valid_attributes }
        expect(response).to redirect_to(labels_path)
      end

      it 'sets a flash notice message' do
        post :create, params: { label: valid_attributes }
        expect(flash[:notice]).to eq('Label was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new label' do
        expect {
          post :create, params: { label: invalid_attributes }
        }.not_to change(Label, :count)
      end

      it 'renders the new label form' do
        post :create, params: { label: invalid_attributes }
        expect(response).to render_template('new')
      end

      it 'sets a flash alert message' do
        post :create, params: { label: invalid_attributes }
        expect(flash[:alert]).to eq("Failed to create label. Name can't be blank.")
      end
    end
  end

end
