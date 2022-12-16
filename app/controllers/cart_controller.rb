class CartController < ApplicationController
before_action :authenticate_user!

  def index
    @product =Product.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    binding.pry
    if @cart_item.save
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
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
