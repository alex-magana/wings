FactoryGirl.define do
  factory :flight do
    flight_code Faker::Code.asin
    airline_code Faker::Code.asin
    source_airport_id 1
    source_airport Faker::Name.first_name
    destination_airport_id 2
    destination_airport Faker::Name.first_name
    gate_id Faker::Code.asin
    departure_date "2016-10-22 20:40:07"
    arrival_date "2016-01-06 02:31:40"
    cost Faker::Number.number(3)
    capacity Faker::Number.number(3)
    available_seats Faker::Number.number(3)
    codeshare Faker::Code.asin
    stops 0
    equipment 0
    is_deleted 0
  end
end
