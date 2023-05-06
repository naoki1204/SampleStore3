require 'rails_helper'

RSpec.describe "user_controller", type: :request do
  describe "ページ表示" do
    before do
        @user = FactoryBot.create(:user)
        sign_in @user
    end
    it "test" do
        get 'users/sessions/new'
        expect(response).to have_http_status(200)
    end
  end
end
