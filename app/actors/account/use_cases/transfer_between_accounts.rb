module Actors
  module Account
    module UseCases
      def self.transfer_between_accounts(account, recipient, amount)
        puts "Transfering #{amount} from account #{account.id} to account #{recipient.id}"
        return false unless account.amount_valid?(amount)
        ActiveRecord::Base.transaction do
          withdraw_from_an_account(account, amount)
          deposit_for_an_account(recipient, amount)
          # emitter.trigger('bank.account.transfered', payload(account, recipient, amount))
        end
      end

      private
      def emitter
        @emitter ||= Clark::EventBus::Emitter
      end

      def payload(account, recipient, amount)
        {
          account: account,
          recipient: recipient,
          amount: amount
        }
      end
    end
  end
end
