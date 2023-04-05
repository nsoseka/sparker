FactoryBot.define do
  factory :address do
    address { Faker::Name.name }
    city { Faker::Name.name }
    postal_code { Faker::Name.name }
    user
  end
end
