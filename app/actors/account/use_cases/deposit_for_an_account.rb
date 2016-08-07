module Actors
  module Account
    module UseCases
      def self.deposit_for_an_account(account, amount)
        puts "Depositing #{amount} for an account #{account.id}"
        return false unless account.amount_valid?(amount)
        account.balance = (account.balance += amount).round(2)
        deposited = account.save!
        # emitter.trigger(bank.account.deposited, account.to_hash.to_json)
        deposited
      end

      private
      def emitter
        @emitter ||= Clark::EventBus::Emitter
      end
    end
  end
end
