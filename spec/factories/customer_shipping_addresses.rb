FactoryGirl.define do
  factory :customer_shipping_address do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code }
  end
end
