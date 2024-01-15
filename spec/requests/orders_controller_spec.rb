require "rails_helper"

RSpec.describe Order, type: :request do
  let!(:user) { create(:user) }
  let!(:order) { create(:order, user_id: user.id) }
  before do
    sign_in user
    @addresses = FactoryBot.create(:address)
  end
  it "GET Orders new" do
    get new_order_path(@addresses)
    expect(response).to have_http_status(200)
  end

  describe 'order#confirm' do

    context 'パラメーターが妥当な場合' do
      let(:params) {{order: attributes_for(:order)} }

      it 'リクエストが成功する' do
        get confirm_path, params: params
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'order#create' do

    context 'パラメーターが妥当な場合' do
      let(:params) {{order: attributes_for(:order)} }

      it 'リクエストが成功する' do
        post "/orders", params: params
        expect(response).to redirect_to cart_index_path
      end
    end
  end
end
