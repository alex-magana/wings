FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name.upcase
    middle_name Faker::Name.first_name.upcase
    last_name Faker::Name.last_name.upcase
    email Faker::Internet.email.upcase
    password Faker::Internet.password(8).upcase
    role
  end
end
