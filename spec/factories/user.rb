FactoryBot.define do
  factory :user do
    id { 1 }
    name { Faker::Lorem.characters(number: 5) }
    # 実際のemailアドレスの形を指定
    email { Faker::Internet.email }
    password { "111111" }
    password_confirmation { "111111" }
    confirmed_at { Date.today }
  end
end
