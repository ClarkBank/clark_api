require 'rails_helper'

describe RegistrationsController do
  describe 'POST create' do
    let(:params) { { user: attributes_for(:user) } }

    it 'registers user and generate token' do
      post :create, params: params, as: :json
      expect(response_body_as_json['token']).not_to eq nil
    end
  end
end
