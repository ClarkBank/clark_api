require 'rails_helper'

describe Actors::Account::UseCases do
  let!(:user) { create(:user) }
  let!(:user_recipient) { create(:user) }
  let(:account_params) { attributes_for(:account, user_id: user.id) }
  let(:recipient_params) { attributes_for(:account, user_id: user_recipient.id) }
  let(:account_instance) { Account.new(account_params) }
  let(:recipient_instance) { Account.new(recipient_params) }

  before do
    allow(account_instance).to receive(:amount_valid?).and_return(true)
  end

  describe 'transfer_between_accounts' do
    subject { described_class.transfer_between_accounts(account_instance, recipient_instance, 9.99) }

    it 'withdrawn balance account instance' do
      subject
      expect(account_instance.balance).to eq 0.0
    end

    it 'deposit balance recipient instance' do
      subject
      expect(recipient_instance.balance).to eq 19.98
    end

    it 'triggers bank.account.opened event' do
    end
  end
end
