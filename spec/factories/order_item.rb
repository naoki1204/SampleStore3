FactoryBot.define do
  factory :order_item do
    #モデルアソシエーション
    association :product
    association :order
    order_quantity { 1 }
    order_price { 100000 }
  end
end
