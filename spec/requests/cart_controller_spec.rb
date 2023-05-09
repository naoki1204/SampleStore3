require "rails_helper"

RSpec.describe CartItem, type: :request do
  it "GET Cart index" do
    get cart_index_path
    expect(response).to have_http_status(200)
  end
end
