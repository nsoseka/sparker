FactoryBot.define do
  factory :coordinate do
    lat { Faker::Name.name }
    lng { Faker::Name.name }
    address
  end
end
