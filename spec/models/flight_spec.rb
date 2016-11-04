require "rails_helper"

RSpec.describe Flight, type: :model do
  subject(:flight) { create :flight }

  describe "associations" do
    it { should have_many(:bookings) }
  end
end
