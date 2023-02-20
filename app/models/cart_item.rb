class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def sum_price # 実際に作成したサイトは税金も算出していたのでメソッドを記載していました
    product.taxin_price*product.quantity
  end
end
