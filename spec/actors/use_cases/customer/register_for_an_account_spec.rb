require 'rails_helper'

describe Actors::Customer::UseCases do
  let(:user_params) { attributes_for(:user) }
  let(:role_params) { { name: 'user' } }
  let(:user_instance) { User.new(user_params) }
  let(:role_instance) { Role.new(role_params) }

  before do
    allow(User).to receive(:new).and_return(user_instance)
    allow(Role).to receive(:find_by).and_return(role_instance)
  end

  describe 'register_for_an_account' do
    subject { described_class.register_for_an_account(user_params) }

    it 'creates user on database' do
      expect(User).to receive(:new).with(user_params)
      subject
    end

    it 'assigns default user role' do
      expect(Role).to receive(:find_by).with(role_params)
      subject
    end

    it 'triggers user.registered event' do
    end
  end
end
