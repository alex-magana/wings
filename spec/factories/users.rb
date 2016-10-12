FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    middle_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    password Faker::Internet.password(8)
    role
  end
end
