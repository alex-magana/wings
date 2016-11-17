FactoryGirl.define do
  factory :airport do
    airport_name Faker::Name.first_name
    city Faker::Name.first_name
    country Faker::Name.name_with_middle
    iata_faa_code "GKA"
    icao_code "AYGA"
    latitude "-6.081689"
    longitude "145.391881"
    altitude "5282.0"
    timezone "10"
    dst "U"
    tz_database_timezone "Pacific/Port_Moresby"
    is_deleted false
  end
end
