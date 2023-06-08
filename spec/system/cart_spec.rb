require "rails_helper"

RSpec.describe CartItem, type: :system do
before do
  sign_in create(:user)
  @product = create(:product) #ここで定義
end
  describe '商品選択のテスト' do

    it '商品選択' do
      visit cart_index_path

      fill_in "params[0][quantity]", with: "1234"
      check "params[0][product_id]"
      click_button "注文"
    end

  end
end
