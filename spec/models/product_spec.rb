require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'モデルのテスト' do
    it "有効なproductの場合は保存されるか" do
      # FactoryBotで作ったデータが有効であるか確認しています
      expect(build(:product)).to be_valid
    end

    context "空白のバリデーションチェック" do
      it "nameが空白の場合にエラーメッセージが返ってくるか" do
        # productにnameカラムを空で保存したものを代入
        product = build(:product, name: nil)
        # バリデーションチェックを行う
        product.valid?
        # nameカラムでエラーが出て、エラーメッセージに"を入力してください"が含まれているか？
        expect(product.errors[:name]).to include("を入力してください")
      end
      it "numberが空白の場合にエラーメッセージが返ってくるか" do
        # emailのバリデーションチェック
        product = build(:product, number: nil)
        product.valid?
        expect(product.errors[:number]).to include("を入力してください")
      end
    end
  end
end
