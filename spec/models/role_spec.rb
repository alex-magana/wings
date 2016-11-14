require "rails_helper"

RSpec.describe Role, type: :model do
  subject(:role) { create(:role) }

  describe "associations" do
    it { is_expected.to have_many(:users) }
  end

  describe "validates role name" do
    it { is_expected.to validate_presence_of :role_name }
  end
end
