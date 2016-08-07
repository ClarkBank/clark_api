require 'rails_helper'

describe RegistrationsController do
  describe 'POST create' do
    let(:role_params) { { name: 'user' } }
    let(:role_instance) { Role.new(role_params) }
    let(:params) { { user: attributes_for(:user) } }

    before do
      allow(Role).to receive(:find_by).and_return(role_instance)
    end

    it 'registers user and generate token' do
      post :create, params: params, as: :json
      expect(response_body_as_json['token']).not_to eq nil
    end
  end
end
