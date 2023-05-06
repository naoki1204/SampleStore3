require 'rails_helper'

RSpec.describe OrderItem, type: :model do
    it "有効なorder_itemの場合は保存されるか" do
      # FactoryBotで作ったデータが有効であるか確認しています
      expect(FactoryBot.create(:order_item)).to be_valid
    end
end
