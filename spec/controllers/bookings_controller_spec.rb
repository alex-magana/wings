require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe '#index' do
    subject(:user) { create :user }
    subject(:booking) { create :booking, user_id: user.id }
    before(:each) { get :index }
    it 'assigns booking records to bookings' do
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
    let(:user) { create :user }
    subject(:booking) { create :booking, user_id: user.id }
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
    let(:flight) { create :flight }
    context 'when user is not logged in' do
      let(:user) { create :user }
      subject(:booking) { create :booking, user_id: user.id }
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
      let(:booking) { create :booking, user_id: user.id }
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
    let(:user) { create :user }
    subject(:booking) { create :booking, user_id: user.id }
    before(:each) { get :edit, id: booking.id }
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the edit template' do
      expect(response).to render_template('edit')
    end
  end
  describe "#create" do
    let(:user) { create :user }
    let(:booking_create_request) do
      post :create, params: { booking: attributes_for(:booking, user_id: user.id,
        passengers: attributes_for(:passenger)) }
    end
    it "create new booking" do
      expect { booking_create_request }.to change(Booking,:count).by(1)
    end
    it 'returns a status code of 302' do
      booking_create_request
      expect(response.status).to eq 302
    end
    it 'redirects to the show view' do
      booking_create_request
      expect(response).to redirect_to(assigns(:booking))
    end
  end
  describe "#update" do
    let(:user) { create :user }
    subject(:booking) { create :booking, user_id: user.id }
    let(:attr) do
      { booking_code: Faker::Code.asin, flight_id: Faker::Number.number(2) }
    end
    before(:each) do
      put :update, id: booking.id, booking: attr
      booking.reload
    end
    it 'updates the booking code of the retrieved booking' do
      expect(booking.booking_code).to eql attr[:booking_code]
    end
    it 'updates the flight id of the retrieved booking' do
      expect(booking.flight_id).to eql attr[:flight_id].to_i
    end
    it 'returns a status code of 302' do
      expect(response.status).to eq 302
    end
    it 'redirects to the show view' do
      expect(response).to redirect_to(booking)
    end
  end
  describe "#destroy" do
    let(:user) { create :user }
    subject(:booking) { create :booking, user_id: user.id }
    let(:booking_destroy_request) do
      delete :destroy, params: { id: booking.id }
    end
    it "deletes a booking" do
      booking_destroy_request
      expect(Booking.where(id: booking.id)).not_to exist
    end
    it 'returns a status code of 200' do
      booking_destroy_request
      expect(response.status).to eq 302
    end
    it "redirects to bookings index" do
      booking_destroy_request
      response.should redirect_to bookings_url
    end
  end
  describe "#confirm_booking" do
    let(:user) { create :user }
    subject(:booking) { create :booking, user_id: user.id }
    let(:passenger) { create :passenger, booking: booking }
    before(:each) do
      stub_current_user(user)
      post :confirm_booking, params: { booking: attributes_for(:booking, user_id: booking.user_id,
       flight_id: booking.flight_id,
       booking_code: booking.booking_code, email: booking.email, passengers: passenger) }
    end
    let(:params) { booking_params }
    it 'assigns booking record to booking' do
      expect(assigns(:booking)).to be_a_new(Booking)
    end
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the confirm_booking template' do
      expect(response).to render_template('confirm_booking')
    end
  end
  describe "#past_bookings" do
    let(:user) { create :user }
    before(:each) do
      stub_current_user(user)
      get :past_bookings
    end
    it 'returns the past bookings of the current user' do
      expect(assigns(:bookings)).to eq Booking.past_bookings(user)
    end
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the past_bookings template' do
      expect(response).to render_template('_past_bookings')
    end
  end
  describe "#manage_bookings" do
    before(:each) { get :manage_bookings }
    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end
    it 'renders the search_booking template' do
      expect(response).to render_template('_search_booking')
    end
  end
  describe "#search_booking" do
    context 'when user is logged in' do
      let(:user) { create :user }
      subject(:booking) { create :booking, user_id: user.id }
      before(:each) do
        stub_current_user(user)
        get :search_booking, params: { booking_code: booking.booking_code }
      end
      let(:params) { search_booking_params }
      let(:available_booking) { Booking.search_booking_write(params) }
      it 'assigns a booking record to booking' do
        booking = assigns(:booking)
        expect(booking.user_id).to eq available_booking.user_id
      end
      it 'returns a status code of 200' do
        expect(response.status).to eq 200
      end
      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end
    end
    context 'when user is not logged in' do
      let(:user) { create :user }
      subject(:booking) { create :booking, user_id: user.id }
      before(:each) do
        get :search_booking, params: { booking_code: booking.booking_code }
      end
      let(:params) { search_booking_params }
      let(:available_booking) { Booking.search_booking_read(params) }
      it 'assigns booking record to booking' do
        expect(assigns(:booking)).to eq available_booking
      end
      it 'returns a status code of 200' do
        expect(response.status).to eq 200
      end
      it 'renders the search_results template' do
        expect(response).to render_template('_search_results')
      end
    end
  end
  private
    def booking_params
      controller.params.require(:booking).permit(:user_id, :flight_id, :booking_code, :email, passengers_attributes: [:id, :passenger_name, :passport_number, :_destroy])
    end
    def search_booking_params
      controller.params.permit(:booking_code)
    end
end
