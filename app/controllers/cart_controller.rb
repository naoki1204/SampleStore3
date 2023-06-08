class CartController < ApplicationController
  before_action :authenticate_user!

  PER = 10
  def index
    @product = Product.page(params[:page]).per(PER)
  end

  def create
    @cart_item = CartItem.new
    params[:params].each do |cart_item|
      cart_item.each do |cart|
        next if cart["product_id"].blank?
        @cart_item.product_id = cart["product_id"]
        @cart_item.quantity = cart["quantity"]
      end
    end

    @cart_item.user = current_user
    if @cart_item.save
      redirect_to new_order_path
    else
      redirect_to :action => "index"
    end
  end

  private

  def set_cart
    @cart_item = Cart_item.find(params[:id])
  end

  def cart_item_params
    params.permit(params: [])
  end
end
