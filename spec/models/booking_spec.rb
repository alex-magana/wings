require "rails_helper"

RSpec.describe Booking, type: :model do
  subject(:user) { create :user }

  subject(:booking) do
    create :booking,
           user_id: user.id,
           passengers_attributes: { :"0" => attributes_for(:passenger) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:flight) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:passengers) }
    it { is_expected.to accept_nested_attributes_for(:passengers) }
  end

  describe "validates booking code" do
    it { is_expected.to validate_presence_of :booking_code }
  end

  describe "validates flight id" do
    it { is_expected.to validate_presence_of :flight_id }
  end

  describe "validates user id" do
    it { is_expected.to validate_presence_of :user_id }
  end

  describe "validates email" do
    it { is_expected.to validate_presence_of :email }
    it do
      is_expected.not_to allow_value(
        "person.ide%ntity[]()@.gmail.com"
      ).for(:email)
    end
  end

  describe "validates cost" do
    it { is_expected.to validate_presence_of :cost }
  end

  describe "searches bookings by booking code" do
    it "returns a booking by booking_code" do
      available_booking = Booking.search_by_booking_code(booking.booking_code)

      expect(available_booking.booking_code).to eq booking.booking_code
    end
  end
end
