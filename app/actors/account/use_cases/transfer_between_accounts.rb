module Actors
  module Account
    module UseCases
      def self.transfer_between_accounts(account, recipient, amount)
        puts "Transfering #{amount} from account #{account.id} to account #{recipient.id}"
        return false unless account.amount_valid?(amount)
        ActiveRecord::Base.transaction do
          withdrawn = withdraw_from_an_account(account, amount)
          deposited = deposit_for_an_account(recipient, amount)
          emitter.trigger(payload(account, recipient, amount), 'bank.account.transfered')
          withdrawn and deposited
        end
      end

      private
      def self.emitter
        Clark::Support::Emitter.adapter
      end

      def self.payload(account, recipient, amount)
        {
          account: account,
          recipient: recipient,
          amount: amount
        }.to_json
      end
    end
  end
end
