FactoryBot.define do
  factory :address do
    # userモデルアソシエーション
    association :user
    address_name { Faker::Address.city }
    address { Faker::Address.street_address }
  end
end
