class ChangeDataQuantityToCartItems < ActiveRecord::Migration[7.0]
  def change
    change_column :cart_items, :quantity, :float
  end
end
