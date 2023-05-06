require 'rails_helper'

RSpec.describe Order, type: :model do
    it "有効なorderの場合は保存されるか" do
      # FactoryBotで作ったデータが有効であるか確認しています
      expect(FactoryBot.create(:order)).to be_valid
    end
end
