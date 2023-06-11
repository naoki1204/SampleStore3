require "rails_helper"

RSpec.describe Address, type: :system do
  before(:each) do
    sign_in create(:user)
    @address = create(:address) #ここで定義
  end
  context '住所の登録' do
    before do
      visit new_address_path
      fill_in "名前", with: "大阪"
      fill_in "住所", with: "吹田"
      click_button "登録する"
    end

    it '作成した住所が表示される' do
      expect(page).to have_content "大阪"
    end
  end

  context "住所の更新" do
    before do
      visit edit_address_path(@address)
      fill_in "名前", with: "兵庫"
      fill_in "住所", with: "神戸"
      click_button "更新する"
    end
    it '更新した住所が表示される' do
      expect(page).to have_content '兵庫'
    end
  end
  context "住所の削除" do
    before do
      visit address_path(@address)
      click_button "Destroy this address"
    end
    it '削除した住所が表示されない' do
      expect(page).to have_no_content '兵庫'
    end
  end
end
