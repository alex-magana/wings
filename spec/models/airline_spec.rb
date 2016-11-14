require "rails_helper"

RSpec.describe Airline, type: :model do
  subject(:airline) { create :airline }

  describe "associations" do
    it { is_expected.to have_many(:flights) }
  end
end
