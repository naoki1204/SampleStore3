FactoryBot.define do
  factory :category do
    code { Faker::Lorem.characters(number: 5) }
    name { Faker::Commerce.department }
  end
end
