require "rails_helper"

RSpec.describe BookingsController, type: :controller do
  let(:user) { create :user }

  subject(:booking) do
    create :booking,
           user_id: user.id,
           passengers_attributes: { :"0" => attributes_for(:passenger) }
  end

  describe "#index" do
    before(:each) do
      stub_current_user(user)
      get :index
    end

    it "assigns booking records to bookings" do
      expect(assigns(:bookings)).to eq user.bookings
    end

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    before(:each) do
      get :show, params: { id: booking.id }
    end

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "#new" do
    let(:flight) { create :flight }

    context "when user is not logged in" do
      before(:each) do
        get :new, params: { flight_id: flight.id, passengers_qty: 3 }
      end

      it "assigns flight to a booking" do
        expect(assigns(:booking).flight).to eq Flight.find(flight.id)
      end

      it "associates passenger(s) with a booking" do
        expect(assigns(:booking).passengers.size).to be >= 1
      end

      it "returns a status code of 200" do
        expect(response.status).to eq 200
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end

    context "when user is logged in" do
      before(:each) do
        stub_current_user(user)
        get :new, params: { flight_id: flight.id, passengers_qty: 3 }
      end

      it "assigns flight to a booking" do
        expect(assigns(:booking).flight).to eq Flight.find(flight.id)
      end

      it "associates passenger(s) with a booking" do
        expect(assigns(:booking).passengers.size).to be >= 1
      end

      it "assigns user email to the booking" do
        expect(assigns(:booking).email).to eq user.email
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "#edit" do
    before(:each) { get :edit, params: { id: booking.id } }

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "#create" do
    let(:flight) { create :flight }

    let(:booking_create_request) do
      post :create,
           params: {
             booking: attributes_for(
               :booking,
               flight_id: flight.id,
               user_id: user.id,
               passengers_attributes: { :"0" => attributes_for(:passenger) }
             )
           }
    end

    it "create new booking" do
      expect { booking_create_request }.to change(Booking, :count).by(1)
    end

    it "returns a status code of 302" do
      booking_create_request
      expect(response.status).to eq 302
    end

    it "redirects to the show view" do
      booking_create_request
      expect(response).to redirect_to(assigns(:booking))
    end
  end

  describe "#update" do
    let(:attr) do
      { flight_id: Faker::Number.between(1, 8), email: Faker::Internet.email }
    end

    before(:each) do
      put :update, params: { id: booking.id, booking: attr }
      booking.reload
    end

    it "updates the booking code of the retrieved booking" do
      expect(booking.email).to eql attr[:email]
    end

    it "updates the flight id of the retrieved booking" do
      expect(booking.flight_id).to eql attr[:flight_id].to_i
    end

    it "returns a status code of 302" do
      expect(response.status).to eq 302
    end

    it "redirects to the show view" do
      expect(response).to redirect_to(booking)
    end
  end

  describe "#destroy" do
    let(:booking_destroy_request) do
      delete :destroy, params: { id: booking.id }
    end

    it "deletes a booking" do
      booking_destroy_request
      expect(Booking.where(id: booking.id)).not_to exist
    end

    it "returns a status code of 200" do
      booking_destroy_request
      expect(response.status).to eq 302
    end

    it "redirects to bookings index" do
      booking_destroy_request
      expect(response).to redirect_to bookings_url
    end
  end

  describe "#confirm_booking" do
    let(:passenger) { create :passenger, booking: booking }

    before(:each) do
      stub_current_user(user)
      post :confirm_booking,
           params: {
             booking: attributes_for(
               :booking,
               user_id: booking.user_id,
               flight_id: booking.flight_id,
               booking_code: booking.booking_code,
               email: booking.email,
               passengers: passenger
             )
           }
    end

    it "assigns booking record to booking" do
      expect(assigns(:booking)).to be_a_new(Booking)
    end

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the confirm_booking template" do
      expect(response).to render_template("confirm_booking")
    end
  end

  describe "#manage_bookings" do
    before(:each) { get :manage_bookings }

    it "returns a status code of 200" do
      expect(response.status).to eq 200
    end

    it "renders the search_booking template" do
      expect(response).to render_template("_search_booking")
    end
  end

  describe "#search_booking" do
    context "with an existing booking code" do
      before(:each) do
        get :search_booking, params: { booking_code: booking.booking_code }
      end

      it "assigns a booking record to booking" do
        expect(assigns(:booking).user_id).to eq booking.user_id
      end

      it "returns a status code of 302" do
        expect(response.status).to eq 302
      end

      it "redirects to the edit template" do
        expect(response).to redirect_to(booking_path(booking))
      end
    end

    context "with a non-existing booking code" do
      before(:each) do
        get :search_booking, params: { booking_code: "" }
      end

      it "assigns booking record to booking" do
        expect(assigns(:booking).blank?).to eq true
      end

      it "redirects to manage_booking_path" do
        expect(response).to redirect_to(manage_bookings_path)
      end
    end
  end
end
