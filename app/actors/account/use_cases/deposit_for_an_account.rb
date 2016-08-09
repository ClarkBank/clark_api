module Actors
  module Account
    module UseCases
      def self.deposit_for_an_account(account, amount)
        puts "Depositing #{amount} for an account #{account.id}"
        return false unless account.amount_valid?(amount)
        account.balance = (account.balance += amount).round(2)
        deposited = account.save!
        emitter.trigger(account.to_json, 'bank.account.deposited')
        deposited
      end

      private
      def self.emitter
        Clark::Support::Emitter.adapter
      end
    end
  end
end
