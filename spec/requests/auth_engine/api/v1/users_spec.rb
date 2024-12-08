require 'rails_helper'

RSpec.describe 'User Registration', type: :request do
  describe 'POST /api/v1/users' do
    let(:valid_params) { { user: { email: 'test@example.com' } } }

    it 'creates a new user' do
      post auth_eng.api_v1_users_url, params: valid_params

      expect(response).to have_http_status(:created)
      expect(AuthEng::User.last.email).to eq('test@example.com')
    end
  end
end
