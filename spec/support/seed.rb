class Seed
  def roles_list
    [
      {role_name: "ADMIN"},
      {role_name: "N_USER"},
      {role_name: "WALK_IN"}
    ]
  end

  def users_list
    [
      {first_name: "ADMIN", middle_name: "ADMIN2", last_name: "ADMIN3", email: "ADMIN@FLIGHTSET.COM", password: "1234567890", role_id: 1},
      {first_name: "WALKIN", middle_name: "WALKIN2", last_name: "WALKIN3", email: "WALKIN@FILGHTSET.COM", password: "1234567890", role_id: 3},
      {first_name: "ALEX", middle_name: "MAGANA", last_name: "GATOBU", email: "PRECIOUS.THIEL.MANN@MURAZIKBALISTRERI.NAME", password: "1234567890", role_id: 2}
    ]
  end

  def airlines_list
    [
      {airline_name: "Private flight", airline_alias: "\\N", iata_code: "-", icao_code: "N/A", call_sign: "", country: "", active: true, is_deleted: false},
      {airline_name: "135 Airways", airline_alias: "\\N", iata_code: "", icao_code: "GNL", call_sign: "GENERAL", country: "United States", active: true, is_deleted: false},
      {airline_name: "1Time Airline", airline_alias: "\\N", iata_code: "1T", icao_code: "RNX", call_sign: "NEXTIME", country: "South Africa", active: true, is_deleted: false},
      {airline_name: "2 Sqn No 1 Elementary Flying Training School", airline_alias: "\\N", iata_code: "", icao_code: "WYT", call_sign: "", country: "United Kingdom", active: true, is_deleted: false},
      {airline_name: "213 Flight Unit", airline_alias: "\\N", iata_code: "", icao_code: "TFU", call_sign: "", country: "Russia", active: true, is_deleted: false},
      {airline_name: "223 Flight Unit State Airline", airline_alias: "\\N", iata_code: "", icao_code: "CHD", call_sign: "CHKALOVSK-AVIA", country: "Russia", active: true, is_deleted: false},
      {airline_name: "224th Flight Unit", airline_alias: "\\N", iata_code: "", icao_code: "TTF", call_sign: "CARGO UNIT", country: "Russia", active: true, is_deleted: false},
      {airline_name: "247 Jet Ltd", airline_alias: "\\N", iata_code: "", icao_code: "TWF", call_sign: "CLOUD RUNNER", country: "United Kingdom", active: true, is_deleted: false}
    ]
  end

  def airports_list
    [
      {airport_name: "Goroka", city: "Goroka", country: "Papua New Guinea", iata_faa_code: "GKA", icao_code: "AYGA", latitude: "-6.081689", longitude: "145.391881", altitude: "5282.0", timezone: "10", dst: "U", tz_database_timezone: "Pacific/Port_Moresby", is_deleted: false},
      {airport_name: "Madang", city: "Madang", country: "Papua New Guinea", iata_faa_code: "MAG", icao_code: "AYMD", latitude: "-5.207083", longitude: "145.7887", altitude: "20.0", timezone: "10", dst: "U", tz_database_timezone: "Pacific/Port_Moresby", is_deleted: false}
    ]
  end

  def flights_list
    [
      {flight_code: "RU", airline_id: 1, airline_code: "", source_airport_id: 1, destination_airport_id: 2, gate_id: 0, departure_date: "2016-10-22 20:40:07", arrival_date: "2016-01-06 02:31:40", cost: "567.0", capacity: 306, available_seats: 316, codeshare: "", stops: 0, equipment: "", is_deleted: false},
      {flight_code: "ID", airline_id: 2, airline_code: "", source_airport_id: 1, destination_airport_id: 2, gate_id: 0, departure_date: "2016-01-28 14:39:48", arrival_date: "2016-12-23 01:52:46", cost: "315.0", capacity: 303, available_seats: 426, codeshare: "", stops: 0, equipment: "", is_deleted: false},
      {flight_code: "BR", airline_id: 3, airline_code: "", source_airport_id: 1, destination_airport_id: 2, gate_id: 0, departure_date: "2016-10-22 23:57:07", arrival_date: "2016-01-21 22:51:42", cost: "315.0", capacity: 214, available_seats: 345, codeshare: "", stops: 0, equipment: "", is_deleted: false},
      {flight_code: "CN", airline_id: 4, airline_code: "", source_airport_id: 1, destination_airport_id: 2, gate_id: 0, departure_date: "2016-04-23 07:24:03", arrival_date: "2016-10-12 12:50:17", cost: "441.0", capacity: 392, available_seats: 465, codeshare: "", stops: 0, equipment: "", is_deleted: false},
      {flight_code: "CN", airline_id: 5, airline_code: "", source_airport_id: 1, destination_airport_id: 2, gate_id: 0, departure_date: "2016-05-03 13:16:39", arrival_date: "2016-06-15 07:57:28", cost: "441.0", capacity: 213, available_seats: 392, codeshare: "", stops: 0, equipment: "", is_deleted: false},
      {flight_code: "CN", airline_id: 6, airline_code: "", source_airport_id: 1, destination_airport_id: 2, gate_id: 0, departure_date: "2016-10-22 20:56:27", arrival_date: "2016-07-02 12:34:06", cost: "567.0", capacity: 337, available_seats: 400, codeshare: "", stops: 0, equipment: "", is_deleted: false},
      {flight_code: "TZ", airline_id: 7, airline_code: "", source_airport_id: 1, destination_airport_id: 2, gate_id: 0, departure_date: "2016-10-03 21:32:18", arrival_date: "2016-09-28 17:15:08", cost: "567.0", capacity: 432, available_seats: 403, codeshare: "", stops: 0, equipment: "", is_deleted: false},
      {flight_code: "FR", airline_id: 8, airline_code: "", source_airport_id: 1, destination_airport_id: 2, gate_id: 0, departure_date: "2016-05-11 04:51:15", arrival_date: "2016-09-30 07:18:35", cost: "315.0", capacity: 448, available_seats: 213, codeshare: "", stops: 0, equipment: "", is_deleted: false}
    ]
  end

  def bookings_list
    [
      {booking_code: "8BF89F19", is_deleted: nil, flight_id: 1, user_id: 2, email: "gatobumalex@gmail.com", cost: "3000.0"},
      {booking_code: "31E3E8D0", is_deleted: nil, flight_id: 2, user_id: 2, email: "gatobumalex@gmail.com", cost: "1000.0"}
    ]
  end

  def passengers_list
    [
      {passenger_name: "ALEX MAGANA GATOBU", passport_number: "TY3678UY25", booking_id: 1},
      {passenger_name: "PASS 2", passport_number: "2DSAFEWE32", booking_id: 1},
      {passenger_name: "PASS 2", passport_number: "2DSAFEWE32", booking_id: 1},
      {passenger_name: "PASS 2", passport_number: "2DSAFEWE32", booking_id: 2},
      {passenger_name: "PASS 2", passport_number: "2DSAFEWE32", booking_id: 2}
    ]
  end

  def create_all
    roles_list.each { |role| Role.create(role) }
    users_list.each { |user| User.create(user) }
    airlines_list.each { |airline| Airline.create(airline) }
    airports_list.each { |airport| Airport.create(airport) }
    flights_list.each { |flight| Flight.create(flight) }
    bookings_list.each { |booking| Booking.create(booking) }
    passengers_list.each { |passenger| Passenger.create(passenger) }
  end
end
