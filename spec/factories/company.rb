FactoryBot.define do
  factory :company do
    department { Faker::Name.name }
    title { Faker::Name.name }
    name { Faker::Name.name }
    user
  end
end
