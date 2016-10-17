require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    before(:each) { get :index }
    it 'assigns user records to users' do
      create(:user)
      expect(assigns(:users)).to eq User.all
    end
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
  describe "#show" do
    subject(:user) { create :user }
    before(:each) do
      get :show, params: { id: user.id }
    end
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end
  describe "#new" do
    subject(:user) { create :user}
    before(:each) do
      get :new
    end
    it 'assigns user record to user' do
      expect(assigns(:user)).to be_a_new(User)
    end
    it 'returns a status code 200' do
      expect(response.status).to eq 200
    end
    it 'renders the new template' do
      expect(response).to render_template('new')
    end
  end
  describe "#edit" do
    subject(:user) { create :user}
    before(:each) { get :edit, id: user.id }
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the edit template' do
      expect(response).to render_template('edit')
    end
  end
  describe "#create" do
    subject(:user) { create :user }
    let(:user_create_request) do
      post :create, params: { first_name: user.first_name,
        middle_name: user.middle_name, last_name: user.last_name,
        email: Faker::Internet.email, password: user.password, role_id: 2 }
    end
    it "creates new user" do
      expect { user_create_request }.to change(User,:count).by(1)
    end
    it 'returns a status code of 302' do
      user_create_request
      expect(response.status).to eq 302
    end
    it 'redirects to the log in view' do
      user_create_request
      expect(response).to redirect_to login_path
    end
  end
  describe "#update" do

  end
  describe "#destroy" do

  end
  describe "#login" do
    it 'renders the login template' do
      get :login
      expect(response).to render_template('login')
    end
  end
  describe "#user_authenticate" do
    subject(:user) { create :user }
    before(:each) do
      post :user_authenticate, params: { email: user.email,
        password: user.password }
    end
    it "logs in the user" do
      expect(session[:user_id]).to eq user.id
    end
    it 'returns a status code of 302' do
      expect(response.status).to eq 302
    end
    it 'redirects to the log in view' do
      expect(response).to redirect_to flights_path
    end
  end
  describe "#logout" do
    it 'sets the value of session key user_id to nil' do
      delete :logout
      expect(session[:user_id]).to eq nil
    end
  end
  describe "#reset_password" do

  end
  private
    def user_params
      controller.params.permit(:first_name, :middle_name, :last_name, :email, :password, :role_id)
    end
end
