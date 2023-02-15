class CartController < ApplicationController
before_action :authenticate_user!

  def index
    @product =Product.all
    # @cart_item = CartItem.new
  end

  def create
    binding.pry
    @cart_item = CartItem.new(cart_item_params)
    # binding.pry
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
    params.permit(:product_id,params[:quantity])
  end
end
