require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  let(:user) { create :user }

  describe "#new" do
    it "renders the new session template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    context "with valid attributes" do
      before(:each) do
        post :create,
             params: {
               email: user.email,
               password: user.password
             }
      end

      it "creates a new session" do
        expect(session[:user_id]).to eq user.id
      end

      it "returns a status code of 302" do
        expect(response.status).to eq 302
      end

      it "redirects to the log in view" do
        expect(response).to redirect_to(flights_path)
      end
    end

    context "with invalid attributes" do
      before(:each) do
        post :create,
             params: {
               email: nil,
               password: user.password
             }
      end

      it "renders the new session template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "#destroy" do
    before(:each) do
      delete :destroy
    end

    it "destroy the current session" do
      expect(session[:user_id]).to eq nil
    end

    it "redirects the user to the root path" do
      expect(response).to redirect_to(root_path)
    end
  end
end
