require 'rails_helper'

RSpec.describe Role, type: :model do
  subject(:role) { create(:role) }
  describe 'associations' do
    it { should have_many(:users) }
  end
  describe '.validate_role_name' do
    it 'must have a role_name' do
      expect(build(:role, role_name: nil).save).to eq false
    end
  end
end
