require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user, email: Faker::Internet.email) }
  describe 'associations' do
    it { should belong_to(:role) }
  end
  describe '.validate_first_name' do
    it 'must have a first_name' do
      expect(build(:user, first_name: nil).save).to eq false
    end

    it 'must have the correct characters' do
      expect(build(:user, first_name: '1234').save).to eql false
    end

    it 'must have the correct length' do
      expect(build(:user, first_name: 'A').save).to eql false
    end
  end

  describe '.validate_middle_name' do
    it 'must have a middle_name' do
      expect(build(:user, middle_name: nil).save).to eq false
    end

    it 'must have the correct characters' do
      expect(build(:user, middle_name: '1234').save).to eql false
    end

    it 'must have the correct length' do
      expect(build(:user, middle_name: 'A').save).to eql false
    end
  end

  describe '.validate_last_name' do
    it 'must have a last_name' do
      expect(build(:user, last_name: nil).save).to eq false
    end

    it 'must have the correct characters' do
      expect(build(:user, last_name: '1234').save).to eql false
    end

    it 'must have the correct length' do
      expect(build(:user, last_name: 'A').save).to eql false
    end
  end

  describe '.validate_email' do
    it 'must have an email' do
      expect(build(:user, email: nil).save).to eql false
    end

    it 'must be unique' do
      expect(build(:user, email: user.email).save).to eql false
    end

    it 'must not contain invalid characters' do
      expect(build(:user, email: 'person.ide%ntity[]()@.gmail.com').save)
        .to eql false
    end
  end

  describe '.validate_password' do
    it 'must have a password' do
      expect(build(:user, password: nil).save).to eql false
    end

    it 'must have the correct length' do
      expect(build(:user, password: 'short').save).to be false
    end
  end
end
