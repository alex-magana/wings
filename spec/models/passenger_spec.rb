require 'rails_helper'

RSpec.describe Passenger, type: :model do
  subject(:passenger) { create(:passenger) }
  describe 'associations' do
    it { should belong_to(:booking) }
  end
  describe '.validate_passenger_name' do
    it 'must have a passenger_name' do
      expect(build(:passenger, passenger_name: nil).save).to eq false
    end

    it 'must have the correct characters' do
      expect(build(:passenger, passenger_name: '1234').save).to eql false
    end

    it 'must have the correct length' do
      expect(build(:passenger, passenger_name: 'A').save).to eql false
    end
  end

  describe '.validate_passport_number' do
    it 'must have a passport_number' do
      expect(build(:passenger, passport_number: nil).save).to eq false
    end
  end
end
