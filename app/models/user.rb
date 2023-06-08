class User < ApplicationRecord
  has_many :orders
  has_many :addresses
  has_many :cart_items
validates :email, uniqueness: true, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

end
