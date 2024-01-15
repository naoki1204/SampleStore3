require "rails_helper"

RSpec.describe Address, type: :request do
  before do
    @address = FactoryBot.create(:address)
  end
  it "GET Addresses index" do
    get addresses_path
    expect(response).to have_http_status(200)
  end

  it "GET Addresses new" do
    get new_address_path
    expect(response).to have_http_status(200)
  end

  it "GET Addresses edit" do
    get edit_address_path(@address.id)
    expect(response).to have_http_status(200)
  end

  it "GET Addresses show" do
    get address_path(@address.id)
    expect(response).to have_http_status(200)
  end
end
