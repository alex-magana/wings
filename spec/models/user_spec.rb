require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  it { is_expected.to belong_to(:role) }
  it { is_expected.to have_many(:bookings) }

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.not_to allow_value("1234").for(:first_name) }
  it do
    is_expected.to validate_length_of(:first_name).is_at_least(3).
      with_message("Too short. The minimum length is 3 characters.")
  end

  it { is_expected.to validate_presence_of :middle_name }
  it { is_expected.not_to allow_value("1234").for(:middle_name) }
  it do
    is_expected.to validate_length_of(:middle_name).is_at_least(3).
      with_message("Too short. The minimum length is 3 characters.")
  end

  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.not_to allow_value("1234").for(:last_name) }
  it do
    is_expected.to validate_length_of(:last_name).is_at_least(3).
      with_message("Too short. The minimum length is 3 characters.")
  end

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }
  it do
    is_expected.not_to allow_value(
      "person.ide%ntity[]()@.gmail.com"
    ).for(:email)
  end

  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe ".authenticate" do
    it "returns a record of a registered user" do
      params = { email: user.email, password: user.password }

      expect(User.authenticate(params).email).to eq params[:email]
    end
  end

  describe ".check_email" do
    it "returns an existing email" do
      params = { email: user.email }

      expect(User.check_email(params).email).to eq params[:email]
    end
  end

  describe ".get_walk_in" do
    it "returns the id of a user belonging to role walk_in" do
      expect(User.get_walk_in.role_id).to eq 3
    end
  end
end
