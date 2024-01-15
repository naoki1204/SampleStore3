require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'モデルのテスト' do
    it "有効なaddressの場合は保存されるか" do
      # FactoryBotで作ったデータが有効であるか確認しています
      expect(build(:address)).to be_valid
    end

    context "空白のバリデーションチェック" do
      it "address_nameが空白の場合にエラーメッセージが返ってくるか" do
        # addressにaddress_nameカラムを空で保存したものを代入
        address = build(:address, address_name: nil)
        # バリデーションチェックを行う
        address.valid?
        # address_nameカラムでエラーが出て、エラーメッセージに"を入力してください"が含まれているか？
        expect(address.errors[:address_name]).to include("を入力してください")
      end
      it "addressが空白の場合にエラーメッセージが返ってくるか" do
        # addressのバリデーションチェック
        address = build(:address, address: nil)
        address.valid?
        expect(address.errors[:address]).to include("を入力してください")
      end
    end
  end
end
