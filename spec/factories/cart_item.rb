FactoryBot.define do
  factory :cart_item do
    #モデルアソシエーション
    association :user
    association :product
    quantity { 100000 }
  end
end
