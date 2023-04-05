FactoryBot.define do
  factory :hair do
    color { Faker::Name.name }
    hair_type { Faker::Name.name }
    user
  end
end
