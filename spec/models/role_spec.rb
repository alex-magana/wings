require "rails_helper"

RSpec.describe Role, type: :model do
  subject(:role) { create(:role) }

  describe "associations" do
    it { should have_many(:users) }
  end

  describe "validates role name" do
    it { should validate_presence_of :role_name }
  end
end
