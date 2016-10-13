require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe '#index' do
    before(:each) { get :index }
    it 'assigns booking records to bookings' do
      create(:booking)
      expect(assigns(:bookings)).to eq Booking.all
    end
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
  describe "#show" do
    let(:booking) { create :booking }
    before(:each) do
      get :show, params: { id: booking.id }
    end
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end
  describe "#new" do
    subject(:booking) { create :booking }
    subject(:flight) { create :flight }
    context 'when user is not logged in' do
      let(:selected_flight) { Flight.find(flight.id) }
      before(:each) { get :new, params: { flight_group: flight.id } }
      it 'assigns flight record to flight' do
        expect(assigns(:flight)).to eq selected_flight
      end
      it 'assigns flight to a booking' do
        booking = assigns(:booking)
        expect(booking.flight).to eq selected_flight
      end
      it 'returns a status code of 200' do
        expect(response.status).to eq 200
      end
      it 'renders the new template' do
        expect(response).to render_template('new')
      end
    end
    context 'when user is logged in' do
      let(:user) { create :user }
      before(:each) do
        stub_current_user(user)
        get :new, params: { flight_group: flight.id }
      end
      it 'assigns user email to the booking' do
        expect(booking.email).to eq user.email
      end
      it 'assigns user id to the booking' do
        expect(booking.user_id).to eq user.id
      end
      it 'renders the new template' do
        expect(response).to render_template('new')
      end
    end
  end
  describe "#edit" do

  end
  describe "#create" do

  end
  describe "#update" do

  end
  describe "#destroy" do

  end
  describe "#confrim_booking" do

  end
  describe "#past_bookings" do

  end
  describe "#manage_bookings" do

  end
  describe "#search_booking" do

  end
end
