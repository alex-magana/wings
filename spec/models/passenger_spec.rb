require "rails_helper"

RSpec.describe Passenger, type: :model do
  it { is_expected.to belong_to(:booking) }

  it { is_expected.to validate_presence_of :passenger_name }
  it { is_expected.not_to allow_value("1234").for(:passenger_name) }
  it { is_expected.to validate_length_of(:passenger_name).is_at_least(3) }

  it { is_expected.to validate_presence_of :passport_number }
end
