require 'rails_helper'

describe AccountsController do
  context 'when has role "admin"' do
    let!(:user) { create(:user_with_admin_role) }
    let!(:account) { create(:account, user_id: user.id) }
    let(:token) { Clark::Support::JwtToken.encode({user_id: user.id}) }

    describe 'POST create' do
      context 'with valid params' do
        let(:params) { { account: attributes_for(:account, user_id: user.id) } }

        it 'returns created status' do
          request.headers['Authorization'] = "Bearer #{token}"
          post :create, params: params, as: :json
          expect(response).to have_http_status(:created)
        end
      end
    end

    describe 'POST deposit' do
      context 'with valid params' do
        let(:params) { { id: account.id, amount: 9.99 } }

        it 'returns 200' do
          request.headers['Authorization'] = "Bearer #{token}"
          put :deposit, params: params, as: :json
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe 'POST withdraw' do
      context 'with valid params' do
        let(:params) { { id: account.id, amount: 9.99 } }

        it 'returns 200' do
          request.headers['Authorization'] = "Bearer #{token}"
          post :withdraw, params: params, as: :json
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe 'POST transfer' do
      context 'with valid params' do
        let!(:user_recipient) { create(:user) }
        let!(:recipient) { create(:account, user_id:  user_recipient.id) }
        let(:params) { { id: account.id, recipient_id: recipient.id, amount: 5.00 } }

        it 'returns 200' do
          request.headers['Authorization'] = "Bearer #{token}"
          post :transfer, params: params, as: :json
          expect(response).to have_http_status(:success)
        end
      end
    end
  end

  context 'when has role "user"' do
    let!(:user) { create(:user_with_user_role) }
    let!(:account) { create(:account, user_id: user.id) }
    let(:token) { Clark::Support::JwtToken.encode({user_id: user.id}) }

    describe 'POST create' do
      context 'with valid params' do
        let(:params) { { account: attributes_for(:account, user_id: user.id) } }

        it 'returns created status' do
          request.headers['Authorization'] = "Bearer #{token}"
          post :create, params: params, as: :json
          expect(response).to have_http_status(:created)
        end
      end
    end

    describe 'POST deposit' do
      let(:params) { { id: account.id, amount: 9.99 } }

      it 'returns 401' do
        request.headers['Authorization'] = "Bearer #{token}"
        put :deposit, params: params, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST withdraw' do
      let(:params) { { id: account.id, amount: 9.99 } }

      it 'returns 401' do
        request.headers['Authorization'] = "Bearer #{token}"
        post :withdraw, params: params, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST transfer' do
      let!(:user_recipient) { create(:user) }
      let!(:recipient) { create(:account, user_id:  user_recipient.id) }
      let(:params) { { id: account.id, recipient_id: recipient.id, amount: 5.00 } }

      it 'returns 401' do
        request.headers['Authorization'] = "Bearer #{token}"
        post :transfer, params: params, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'when has role "guest"' do
    let!(:user) { create(:user_with_guest_role) }
    let!(:account) { create(:account, user_id: user.id) }
    let(:token) { Clark::Support::JwtToken.encode({user_id: user.id}) }

    describe 'POST create' do
      let(:params) { { account: attributes_for(:account, user_id: user.id) } }

      it 'returns 401' do
        request.headers['Authorization'] = "Bearer #{token}"
        post :create, params: params, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST deposit' do
      let(:params) { { id: account.id, amount: 9.99 } }

      it 'returns 401' do
        request.headers['Authorization'] = "Bearer #{token}"
        put :deposit, params: params, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST withdraw' do
      let(:params) { { id: account.id, amount: 9.99 } }

      it 'returns 401' do
        request.headers['Authorization'] = "Bearer #{token}"
        post :withdraw, params: params, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'POST transfer' do
      let!(:user_recipient) { create(:user) }
      let!(:recipient) { create(:account, user_id:  user_recipient.id) }
      let(:params) { { id: account.id, recipient_id: recipient.id, amount: 5.00 } }

      it 'returns 401' do
        request.headers['Authorization'] = "Bearer #{token}"
        post :transfer, params: params, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
