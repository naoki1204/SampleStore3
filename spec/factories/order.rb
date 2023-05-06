FactoryBot.define do
  factory :order do
    # userモデルアソシエーション
    association :user
    order_name { Faker::Commerce.product_name }
    order_address { Faker::Internet.email }
    total_price { 100000 }
    postage { 100000 }
    status { 1 }
    payment_method { 1 }
  end
end
