require "rails_helper"

RSpec.describe Order, type: :system do
before do
  sign_in create(:user)
  @product = create(:product)
  @cart_item = create(:cart_item)
  @address = create(:address)
  @order = create(:order)

end
  describe '注文情報入力のテスト' do
    before '注文情報入力' do
      visit new_order_path

      choose "order_payment_method_クレジットカード"
      choose "order_address_option_2"
      fill_in "住所", with: "奈良県奈良市"
      fill_in "宛名", with: "佐藤"
      click_button "確認画面へ進む"
    end
    it "入力した情報が表示される" do
      expect(page).to have_content "奈良県奈良市"
    end

  end
end
