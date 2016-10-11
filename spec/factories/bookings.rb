FactoryGirl.define do
  factory :booking do
    flight
    booking_code Faker::Code.asin
    flight_id Faker::Number.number(2)
    user_id Faker::Number.number(2)
    email Faker::Internet.email
  end
end
