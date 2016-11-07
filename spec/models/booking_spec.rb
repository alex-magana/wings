require "rails_helper"

RSpec.describe Booking, type: :model do
  subject(:user) { create :user }

  subject(:booking) { create :booking, user_id: user.id }

  describe "associations" do
    it { should belong_to(:flight) }
  end

  describe "associations" do
    it { should have_many(:passengers) }
  end

  describe "validates booking code" do
    it { should validate_presence_of :booking_code }
  end

  describe "validates flight id" do
    it { should validate_presence_of :flight_id }
  end

  describe "validates user id" do
    it { should validate_presence_of :user_id }
  end

  describe "validates email" do
    it { should validate_presence_of :email }
    it { should_not allow_value("person.ide%ntity[]()@.gmail.com").for(:email) }
  end

  describe "validates cost" do
    it { should validate_presence_of :cost }
  end

  describe "finds bookings by user id" do
    it "returns bookings of a registered user" do
      stub_current_user(user)
      create :booking, user_id: user.id

      available_booking = Booking.find_by_user(user)

      expect(available_booking.first.user_id).to eq user.id
    end
  end

  describe "finds bookings by booking code" do
    it "returns a booking by booking_code" do
      available_booking = Booking.find_by_booking_code(booking.booking_code)
      expect(available_booking.first.booking_code).to eq booking.booking_code
    end
  end
end
