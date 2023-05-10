require "rails_helper"

RSpec.describe CartItem, type: :request do
  it "GET Cart index" do
    get cart_index_path
    expect(response).to have_http_status(200)
  end
  describe 'cart#create' do

    context 'パラメーターが妥当な場合' do
      let(:params) {{cart_item: attributes_for(:cart_item)} }

      it 'リクエストが成功する' do
        binding.pry
        post "/cart", params: params
        expect(response).to redirect_to new_order_path
      end
    end
  end
end
