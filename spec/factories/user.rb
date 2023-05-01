FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
    # 実際のemailアドレスの形を指定
    email { Faker::Internet.email }
    encrypted_password { Faker::Lorem.characters(number: 8) }
  end
end
