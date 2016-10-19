FactoryGirl.define do
  factory :booking do
    booking_code Faker::Code.asin
    flight_id Faker::Number.number(2)
    email "precious.thiel@murazikbalistreri.name"
    user_id Faker::Number.number(2)
    flight
  end
end
