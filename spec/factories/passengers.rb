FactoryGirl.define do
  factory :passenger do
    passenger_name Faker::Name.first_name
    passport_number Faker::Code.asin
  end
end
