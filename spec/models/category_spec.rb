require 'rails_helper'

RSpec.describe Category, type: :model do
    it "有効なcategoryの場合は保存されるか" do
      # FactoryBotで作ったデータが有効であるか確認しています
      expect(FactoryBot.create(:category)).to be_valid
    end
end
