FactoryBot.define do
  factory :order do
    # userモデルアソシエーション
    association :user
    order_name { Faker::Commerce.product_name }
    order_address { Faker::Internet.email }
    total_price { Faker::Number.number(9) }
  end
end
