require 'rails_helper'
Capybara.default_wait_time = 15

RSpec.feature 'AnonymousUserUsesTheApp', js: true do
  scenario 'User visits the website' do
    visit root_path
    expect(find_all("ul.main-nav li.top-right a").first).to have_content("Sign In")
    expect(find_all("ul.main-nav li.top-right a")[1]).to have_content("Sign Up")
    expect(page).to_not have_content("Past bookings")
  end
  scenario 'User searches for a flight' do
    search_flights
    sleep(0.3)
    expect(page).to have_content('AIRLINE')
  end
  scenario 'User selects a flight' do
    search_flights
    sleep(0.3)
    selected_flight = find_all("table tbody tr td input").first
    sleep(0.3)
    selected_flight.click
    click_button('select-flight')
    expect(page).to have_content("ADD PASSENGER")
  end
  scenario 'User adds booking details' do
    search_flights
    add_booking_details
    expect(find_all("div.actions input").first.value).to eq "CONFIRM"
  end
  scenario 'User confrims booking' do
    search_flights
    add_booking_details
    find_all("div.actions input").first.click
    expect(page).to have_content("HOME")
  end
end
