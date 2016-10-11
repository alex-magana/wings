require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject(:booking) { create(:booking) }
  describe 'associations' do
    it { should belong_to(:flight) }
  end
  describe 'associations' do
    it { should have_many(:passengers) }
  end
  describe 'validates booking code' do
    it { should validate_presence_of :booking_code }
  end
  describe 'validates flight id' do
    it { should validate_presence_of :flight_id }
  end
  describe 'validates user id' do
    it { should validate_presence_of :user_id }
  end
  describe 'validates email' do
    it { should validate_presence_of :email }
    it { should_not allow_value('person.ide%ntity[]()@.gmail.com').for(:email) }
  end
end
