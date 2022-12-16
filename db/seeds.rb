# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = Category.create([{code: '110', name: '文房具'}, {code: '120', name: '家電'}, {code: '210', name: '書籍'}])

#  商品サンプルデータの登録（3件）
Product.create(
  [
    {number: "1000001", name: "商品A", unit_price: 2000, description: "文房具", category_id: categories[0].id},
    {number: "2000001", name: "商品B", unit_price: 125000, description: "家電", category_id: categories[1].id},
    {number: "3000001", name: "商品C", unit_price: 5500, description: "書籍", category_id: categories[2].id}
  ]
)
#  利用者（顧客）サンプルデータの登録（2件）
# User.create([
#   {type: "Customer", name: "山田太郎", e_mail: "y_taro@example.com",
#   address: "東京都中央区1丁目1番地", tel_number: "03-3333-3333", password: "taropassword"},
#   {type: "Customer", name: "田中花子", e_mail: "t_hana@example.com",
#   address: "北海道札幌市", tel_number: "011-111-1111", password: "hanapassword"},
# ])
