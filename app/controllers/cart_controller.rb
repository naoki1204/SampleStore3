class CartController < ApplicationController
before_action :authenticate_user!

  def index
    @product =Product.all
    # @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new
    params[:params].each do |cart_item|
      cart_item.each do |cart|
        if cart["product_id"].present?
          @cart_item.product_id = cart["product_id"]
          @cart_item.quantity = cart["quantity"]
        end
      end
    end

    @cart_item.user_id = current_user.id
    if @cart_item.save
      redirect_to new_order_path
    else
      redirect_to :action => 'index'
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart_item = Cart_item.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def cart_item_params
    params.permit(params:[])
  end
end
