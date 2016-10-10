require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject(:booking) { create(:booking) }
  describe 'associations' do
    it { should belong_to(:flight) }
  end
  describe 'associations' do
    it { should have_many(:passengers) }
  end
  describe '.validate_booking_code' do
    it 'must have a booking_code' do
      expect(build(:booking, booking_code: nil).save).to eq false
    end
  end

  describe '.validate_flight_id' do
    it 'must have a flight_id' do
      expect(build(:booking, flight_id: nil).save).to eq false
    end
  end

  describe '.validate_user_id' do
    it 'must have a user_id' do
      expect(build(:booking, user_id: nil).save).to eq false
    end
  end

  describe '.validate_email' do
    it 'must have an email' do
      expect(build(:booking, email: nil).save).to eql false
    end

    it 'must not contain invalid characters' do
      expect(build(:booking, email: 'person.ide%ntity[]()@.gmail.com').save)
        .to eql false
    end
  end
end
