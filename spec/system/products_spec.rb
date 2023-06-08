require "rails_helper"

RSpec.describe Product, type: :system do
before(:each) do
  @product = create(:product) #ここで定義
end
  describe '商品管理のテスト' do

    it '商品の登録' do
      visit new_product_path

      fill_in "Number", with: "1234"
      fill_in "Name", with: "ソファー"
      fill_in "Unit price", with: "100000"
      fill_in "Image", with: "テスト"
      fill_in "Description", with: "テスト"
      fill_in "Quantity", with: "1"
      click_button "登録する"
    end

    it "商品の更新" do
      visit edit_product_path(@product)

      fill_in "Number", with: "1234"
      fill_in "Name", with: "ソファー"
      fill_in "Unit price", with: "100000"
      fill_in "Image", with: "テスト"
      fill_in "Description", with: "テスト"
      fill_in "Quantity", with: "1"
      click_button "更新する"
    end

    it "商品の削除" do
      visit product_path(@product)

      click_button "Destroy this product"
    end
  end
end
