require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe "associations" do
    it { should belong_to(:role) }
  end

  describe "validates first name" do
    it { should validate_presence_of :first_name }
    it { should_not allow_value("1234").for(:first_name) }
    it do
      should validate_length_of(:first_name).is_at_least(3).
        with_message("Too short. The minimum length is 3 characters.")
    end
  end

  describe "validates middle name" do
    it { should validate_presence_of :middle_name }
    it { should_not allow_value("1234").for(:middle_name) }
    it do
      should validate_length_of(:middle_name).is_at_least(3).
        with_message("Too short. The minimum length is 3 characters.")
    end
  end

  describe "validates last name" do
    it { should validate_presence_of :last_name }
    it { should_not allow_value("1234").for(:last_name) }
    it do
      should validate_length_of(:last_name).is_at_least(3).
        with_message("Too short. The minimum length is 3 characters.")
    end
  end

  describe "validates email" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should_not allow_value("person.ide%ntity[]()@.gmail.com").for(:email) }
  end

  describe "validates password" do
    it { should validate_presence_of :password }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "authenticates user" do
    it "returns a record of a registered user" do
      params = { email: user.email, password: user.password }

      expect(User.user_authenticate(params).first.email).to eq params[:email]
    end
  end

  describe "checks whether email is in use" do
    it "returns an existing email" do
      params = { email: user.email }

      expect(User.check_email(params).first.email).to eq params[:email]
    end
  end

  describe "retrieves a user of type walk_in" do
    it "returns the id of a user belonging to role walk_in" do
      expect(User.get_walk_in.role_id).to eq 3
    end
  end
end
