class OrdersController < ApplicationController
  def cart
  end

  PER=5
  def new
    @order = Order.new
    @addresses = current_user.addresses.page(params[:page]).per(PER)
    # render "confirm"
  end

  def confirm
    @order = Order.new(order_params)
    # @orderはでかい箱で、その中に小さい箱を指定するためにストロングパラメーターを指定している。

    # if文を記述して、hidden fieldが作動するようにする。
    # ご自身の住所と配送先住所が選択された場合はhiddenで処理

    # 現在memberに登録されている住所であれば
  case params[:order][:address_option]
    when "0"
      @addresses = current_user.addresses
      @order.order_address = @addresses[0].address
      @order.order_name = @addresses[0].address_name
    # For collection.select
    when "1"
      ship = Address.find(params[:order][:user_id])
      @order.order_address = ship.address
      @order.order_name = ship.address_name
    # For a new address input
    else
      @order.order_address = params[:order][:order_address]
      @order.order_name = params[:order][:order_name]
    end

    @cart_items = current_user.cart_items.all
    @order.user_id = current_user.id
  end

  # 注文情報保存
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.save
    # ordered_itmemの保存
    current_user.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_item = OrderItem.new #初期化宣言
      @order_item.product_id = cart_item.product_id
      @order_item.order_id = @order.id
      @order_item.order_quantity = cart_item.quantity
      # 購入が完了したらカート情報は削除するのでこちらに保存します
      @order_item.order_price = (cart_item.product.unit_price * 1.08).floor
      @order_item.save #注文商品を保存
    end #ループ終わり

    current_user.cart_items.destroy_all #カートの中身を削除
    redirect_to cart_index_path
  end

  def destroy
  end

  def index
  end

  private

  def order_params
    params.require(:order).permit(:postage, :payment_method, :order_name, :order_address, :user_id, :total_price, :status)
  end
end
