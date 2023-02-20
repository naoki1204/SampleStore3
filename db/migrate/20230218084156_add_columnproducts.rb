class AddColumnproducts < ActiveRecord::Migration[7.0]
  def up
    add_column :products, :quantity, :float
  end
end
