require 'rails_helper'

RSpec.describe Passenger, type: :model do
  subject(:passenger) { create(:passenger) }
  describe 'associations' do
    it { should belong_to(:booking) }
  end
  describe 'validates passenger name' do
    it { should validate_presence_of :passenger_name }
    it { should_not allow_value('1234').for(:passenger_name) }
    it { should validate_length_of(:passenger_name).is_at_least(3) }
  end
  describe 'validates passport number' do
    it { should validate_presence_of :passport_number }
  end
end
