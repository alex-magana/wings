require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
  describe '#index' do
    context 'when user is logged out' do
      it 'renders the index template' do
        expect(response).to render_template :index
      end
    end

    context 'when user is logged in' do
      let(:user) { create :user }
      before(:each) do
        stub_current_user(user)
        get :index
      end

      it 'renders the index template' do
        expect(response).to render_template :index
      end

      it 'returns a 200 status' do
        expect(response.status).to eq 200
      end
    end
  end
end
