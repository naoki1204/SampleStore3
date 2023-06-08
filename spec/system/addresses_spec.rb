require "rails_helper"

RSpec.describe Address, type: :system do
before(:each) do
  @address = create(:address) #ここで定義
end
  describe '住所管理のテスト' do

    it '住所の登録' do
      visit new_address_path

      fill_in "名前", with: "大阪"
      fill_in "住所", with: "吹田"
      click_button "登録する"
    end

    it "住所の更新" do
      visit edit_address_path(@address)
      fill_in "名前", with: "兵庫"
      fill_in "住所", with: "神戸"

      click_button "更新する"
    end

    it "住所の削除" do
      visit address_path(@address)

      click_button "Destroy this address"
    end
  end
end
