require "rails_helper"

RSpec.describe "Address", type: :request do
  # let!(:address) { create(:address) }
  it "GET Addresses index" do
    get addresses_path
    expect(response).to have_http_status(200)
  end

  it "GET Addresses new" do
    get new_address_path
    expect(response).to have_http_status(200)
  end
end
