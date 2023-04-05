FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    maiden_name { Faker::Name.name }
    blood_group { %w(O A B B+).sample }
    gender { %w(male female).sample }
  end
end
