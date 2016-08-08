require 'rails_helper'

describe Actors::Account::UseCases do
  let!(:user) { create(:user) }
  let(:account_params) { attributes_for(:account, user_id: user.id) }
  let(:account_instance) { Account.new(account_params) }
  let(:emitter) { instance_double(Clark::EventBus::Emitter) }

  before do
    allow(Account).to receive(:new).and_return(account_instance)
    allow(Clark::EventBus::Emitter).to receive(:new).and_return(emitter)
    allow(emitter).to receive(:trigger)
  end

  after do
    Clark::Support::Emitter.instance_variable_set('@emitter', nil)
  end

  describe 'open_bank_account' do
    subject { described_class.open_bank_account(account_params) }

    it 'creates account on database' do
      expect(Account).to receive(:new).with(account_params)
      subject
    end

    it 'triggers bank.account.opened event' do
    end
  end
end
