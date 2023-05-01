FactoryBot.define do
  factory :product do
    # categoryモデルアソシエーション
    association :category
    number { Faker::Lorem.characters(number: 10) }
    name { Faker::Commerce.product_name }
    # unit_price { Faker::Number.number(5) }
  end
end
