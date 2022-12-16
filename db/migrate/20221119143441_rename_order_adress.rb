class RenameOrderAdress < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :order_adress, :order_address
  end
end
