require 'rails_helper'

RSpec.describe CartItem, type: :model do
    it "有効なcart_itemの場合は保存されるか" do
      # FactoryBotで作ったデータが有効であるか確認しています
      expect(FactoryBot.create(:cart_item)).to be_valid
    end
end
