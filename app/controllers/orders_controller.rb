class OrdersController < ApplicationController
  def cart
  end

  def new
    @order = Order.new
    @addresses = current_user.addresses.all
    # render "confirm"
  end

  def confirm
    @order = Order.new(order_params)
    # @orderはでかい箱で、その中に小さい箱を指定するためにストロングパラメーターを指定している。

    # if文を記述して、hidden fieldが作動するようにする。
    # ご自身の住所と配送先住所が選択された場合はhiddenで処理

    # 現在memberに登録されている住所であれば
    if params[:order][:address_option] == "0"
      binding.pry
      @order.order_address = current_user.address
      @order.order_name = current_user.name

      # collection.selectであれば
    elsif params[:order][:address_option] == "1"
      binding.pry
      ship = Address.find(params[:order][:user_id])
      @order.order_address = ship.address
      @order.order_name = ship.address_name

      # 新規住所入力であれば
    elsif params[:order][:address_option] = "2"
      @order.order_address = params[:order][:order_address]
      @order.order_name = params[:order][:order_name]
    else
      render "new"
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
      @order_item = OrdereItem.new #初期化宣言
      @order_item.product_id = cart.product_id
      @order_item.order_id = @order.id
      @order_item.order_quantity = cart.quantity
      # 購入が完了したらカート情報は削除するのでこちらに保存します
      @order_item.order_price = (cart.product.unit_price * 1.08).floor
      @order_item.save #注文商品を保存
    end #ループ終わり

    current_member.cart_items.destroy_all #カートの中身を削除
    redirect_to thanx_orders_path
  end

  def destroy
  end

  def index
  end

  private

  def order_params
    params.require(:order).permit(:postage, :payment_method, :name, :address, :user_id, :total_price, :status)
  end
end
