require 'csv'
class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]

  PER = 10
  def index
    @addresses = Address.page(params[:page]).per(PER)

    respond_to do |format|
      format.html
      format.csv do |csv|
        send_addresses_csv(@addresses)
      end
    end
  end

  def show
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user

    respond_to do |format|
      if @address.save
        format.html { redirect_to address_url(@address), notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to address_url(@address), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:address_name, :address)
  end

  def send_addresses_csv(addresses)
    csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932)  do |csv|
      header = %w(番号 名前 住所)
      csv << header
      addresses.each do |address|
        values = [address.id,address.address_name,address.address,]
        csv << values
      end
    end
    send_data(csv_data, filename: "addresses.csv")
  end

end
