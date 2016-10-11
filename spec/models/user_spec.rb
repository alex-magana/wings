require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }
  describe 'associations' do
    it { should belong_to(:role) }
  end
  describe 'validates first name' do
    it { should validate_presence_of :first_name }
    it { should_not allow_value('1234').for(:first_name) }
    it do
      should validate_length_of(:first_name).is_at_least(3)
        .with_message("Too short. The minimum length is 3 characters.")
    end
  end
  describe 'validates middle name' do
    it { should validate_presence_of :middle_name }
    it { should_not allow_value('1234').for(:middle_name) }
    it do
      should validate_length_of(:middle_name).is_at_least(3)
        .with_message("Too short. The minimum length is 3 characters.")
    end
  end
  describe 'validates last name' do
    it { should validate_presence_of :last_name }
    it { should_not allow_value('1234').for(:last_name) }
    it do
      should validate_length_of(:last_name).is_at_least(3)
        .with_message("Too short. The minimum length is 3 characters.")
    end
  end
  describe 'validates email' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email}
    it { should_not allow_value('person.ide%ntity[]()@.gmail.com').for(:email) }
  end
  describe 'validate password' do
    it { should validate_presence_of :password }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
