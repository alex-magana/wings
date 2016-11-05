Flightset

[![Coverage Status](https://coveralls.io/repos/github/andela-amagana/wings/badge.svg)](https://coveralls.io/github/andela-amagana/wings) [![Code Climate](https://codeclimate.com/github/andela-amagana/wings/badges/gpa.svg)](https://codeclimate.com/github/andela-amagana/wings) [![Issue Count](https://codeclimate.com/github/andela-amagana/wings/badges/issue_count.svg)](https://codeclimate.com/github/andela-amagana/wings)

##Description

Flightset is a flight booking web application that helps travellers find flights to their desired destinations. The application can be accessed via this link: [Flightset](https://flightset.herokuapp.com/)

## Features

### Anonymous User

  An anonymous user is not required to register or sign in to perform functions. This user has access to the following functions:

    * Search for and filter flights by "Origin", "Destination", "No of Passengers" and "Departure Date"
    * Select and book a preferred flights from the matching options presented
    * Receive a booking confirmation email after booking a flight successfully
    * Search for booking details by the unique booking reference number

### Registered User

  A registered user can:

    * View all past bookings on his/her dashboard
    * Manage past bookings including editing/updating or cancelling bookings

## Instructions for Getting Started

  To use the app, visit https://flightset.herokuapp.com/.

  To test and run the app locally follow the instructions below:

### Installation

 Clone the repo to a directory on your local machine using git clone command as shown below:

    $  git clone https://github.com/andela-amagana/wings.git

 Get into the wings directory:

    $  cd wings

 Install dependencies

    $  bundle install

 Setup / Migrate database

    $ rails db:setup

 Seed database with data

    $ rails db:seed

 Start the puma server

    $ rails server

 Visit http://localhost:3000 to view the application on your browser.


### Using the Application

 Start the puma server

    $ rails server

 Visit http://localhost:3000 on your browser

 Follow the intuitive guides to search for and book flights.


## Running the Tests

To test the application, run 'bundle exec rspec' from the wings directory after you have installed all the dependencies i.e. using 'bundle install' as previously described.

    $  bundle exec rspec


## Limitations
  * The airports, airlines and flights cannot be edited.
  * Payment for flights is not supported.
