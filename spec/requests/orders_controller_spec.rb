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

  # it "GET Orders confirm" do
  #   binding.pry
  #   get confirm_path(order)
  #   expect(response).to have_http_status(200)
  # end
end
