class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_item
  has_many :order_item
  def taxin_price
        unit_price*1.1
  end
end
