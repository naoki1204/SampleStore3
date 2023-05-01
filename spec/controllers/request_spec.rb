require "rails_helper"

RSpec.describe OrdersController, type: :controller do
  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_user_url
      expect(response.status).to eq 200
    end
end
