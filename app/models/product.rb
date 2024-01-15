class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_item
  has_many :order, through: :order_item
  validates :name, presence: true
  validates :number, presence: true

  def taxin_price
    unit_price * 1.1
  end

  enum status: {
     "入金待ち":0,
     "入金確認":1,
     "製作中":2,
     "発送準備中":3,
     "発送済み":4
  }
enum payment_method: ["クレジットカード", "銀行振込"]
end
