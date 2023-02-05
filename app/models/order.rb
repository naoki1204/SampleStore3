class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  attr_accessor :address_number
end
