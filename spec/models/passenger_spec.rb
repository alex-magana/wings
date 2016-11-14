require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:booking) }
  end

  describe "validates passenger name" do
    it { is_expected.to validate_presence_of :passenger_name }
    it { is_expected.not_to allow_value("1234").for(:passenger_name) }
    it { is_expected.to validate_length_of(:passenger_name).is_at_least(3) }
  end

  describe "validates passport number" do
    it { is_expected.to validate_presence_of :passport_number }
  end
end
