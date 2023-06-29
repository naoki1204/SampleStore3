require 'csv'
class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  PER =20
  def index
    @products = Product.page(params[:page]).per(PER)

    respond_to do |format|
      format.html
      format.csv do |csv|
        send_users_csv(@products)
      end

      format.pdf do

        # pdfを新規作成。インスタンスを渡す。
        pdf = RecordPdf.new(@products)

        send_data pdf.render,
          filename:    "product.pdf",
          type:        "application/pdf",
          disposition: "inline" # 画面に表示。外すとダウンロードされる。
      end
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:number, :name, :unit_price, :image, :description, :quantity, :category_id)
  end

  def record_not_found
  redirect_to products_path
  end

  def send_users_csv(products)
    csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932)  do |csv|
      header = %w(番号 名前 単価 備考 種類)
      csv << header
      products.each do |product|
        values = [product.number,product.name,product.unit_price,product.description,product.category_id]
        csv << values
      end
    end
    send_data(csv_data, filename: "products.csv")
  end

end
