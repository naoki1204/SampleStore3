require "rails_helper"

RSpec.describe Product, type: :request do
  before do
    @product = FactoryBot.create(:product)
  end
  it "GET Products index" do
    get products_path
    expect(response).to have_http_status(200)
  end

  it "GET Products new" do
    get new_product_path
    expect(response).to have_http_status(200)
  end

  it "GET Products edit" do
    get edit_product_path(@product.id)
    expect(response).to have_http_status(200)
  end

  it "GET Products show" do
    get product_path(@product.id)
    expect(response).to have_http_status(200)
  end
end
