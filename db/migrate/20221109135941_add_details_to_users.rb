class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_column :users, :tel_numer, :string
  end
end
