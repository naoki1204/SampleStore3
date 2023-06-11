require "rails_helper"

RSpec.describe Product, type: :system do
  before(:each) do
    @product = create(:product) #ここで定義
  end
  describe '商品管理のテスト' do

    context '商品の登録' do
      before do
        visit new_product_path

        fill_in "Number", with: "1234"
        fill_in "Name", with: "ソファー"
        fill_in "Unit price", with: "100000"
        fill_in "Image", with: "テスト"
        fill_in "Description", with: "テスト"
        fill_in "Quantity", with: "1"
        click_button "登録する"
      end
      it "作成した商品が表示される" do
        expect(page).to have_content "ソファー"
      end
    end

    context "商品の更新" do
      before do
        visit edit_product_path(@product)
        fill_in "Number", with: "1234"
        fill_in "Name", with: "キッチンテーブル"
        fill_in "Unit price", with: "100000"
        fill_in "Image", with: "テスト"
        fill_in "Description", with: "テスト"
        fill_in "Quantity", with: "1"
        click_button "更新する"
      end
      it "更新した商品が表示される" do
        expect(page).to have_content "キッチンテーブル"
      end
    end
    context "商品の削除" do
      before do
        visit product_path(@product)

        click_button "Destroy this product"
      end
      it "削除した商品が表示されない" do
        expect(page).to have_no_content "キッチンテーブル"
      end
    end
  end
end
