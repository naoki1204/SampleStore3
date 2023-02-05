class AddColumnOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :postage, :float
    add_column :orders, :status, :integer
    add_column :orders, :payment_method, :integer
  end
end
