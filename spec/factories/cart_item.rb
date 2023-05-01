FactoryBot.define do
  factory :cart_item do
    #モデルアソシエーション
    association :user
    association :product
    quantity { Faker::Number.number(5) }
  end
end
