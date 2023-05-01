FactoryBot.define do
  factory :order_item do
    #モデルアソシエーション
    association :product
    association :order
    order_quantity { Faker::Number.number(5) }
    order_price { Faker::Number.number(5) }
  end
end
