module Actors
  module Account
    module UseCases
      def self.withdraw_from_an_account(account, amount)
        puts "Withdrawing #{amount} from an account #{account.id}"
        return false unless account.amount_valid?(amount)
        account.balance = (account.balance -= amount).round(2)
        withdrawn = account.save!
        # emitter.trigger(bank.account.withdrawn, account.to_hash.to_json)
        withdrawn
      end

      private
      def emitter
        @emitter ||= Clark::EventBus::Emitter
      end
    end
  end
end
