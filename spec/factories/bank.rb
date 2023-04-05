FactoryBot.define do
  factory :bank do
    card_expire { Date.today }
    card_type { Faker::Name.name }
    currency { Faker::Name.name }
    card_number { Faker::Name.name }
    user
  end
end
