FactoryGirl.define do
  factory :airline do
    airline_name "213 Flight Unit"
    airline_alias Faker::Code.asin
    iata_code Faker::Code.asin
    icao_code Faker::Code.asin
    call_sign Faker::Code.asin
    country "United States"
    active "Y"
    is_deleted "0"
  end
end
