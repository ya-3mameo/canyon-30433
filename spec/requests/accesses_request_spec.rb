require 'rails_helper'

RSpec.describe 'Accesses', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/accesses/index'
      expect(response).to have_http_status(:success)
    end
  end
end
