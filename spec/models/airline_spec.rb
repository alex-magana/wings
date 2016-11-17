require "rails_helper"

RSpec.describe Airline, type: :model do
  subject(:airline) { create :airline }

  it { is_expected.to have_many(:flights) }
end
