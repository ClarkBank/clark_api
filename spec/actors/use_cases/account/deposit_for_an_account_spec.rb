require 'rails_helper'

describe Actors::Account::UseCases do
  let!(:user) { create(:user) }
  let(:account_params) { attributes_for(:account, user_id: user.id) }
  let(:account_instance) { Account.new(account_params) }

  before do
    allow(account_instance).to receive(:amount_valid?).and_return(true)
  end

  describe 'deposit_for_an_account' do
    subject { described_class.deposit_for_an_account(account_instance, 1.0) }

    it 'withdrawn balance account' do
      subject
      expect(account_instance.balance).to eq 10.99
    end

    it 'triggers bank.account.opened event' do
    end
  end
end
