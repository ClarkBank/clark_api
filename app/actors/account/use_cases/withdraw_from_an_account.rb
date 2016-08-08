module Actors
  module Account
    module UseCases
      def self.withdraw_from_an_account(account, amount)
        puts "Withdrawing #{amount} from an account #{account.id}"
        return false unless account.amount_valid?(amount)
        account.balance = (account.balance -= amount).round(2)
        withdrawn = account.save!
        emitter.trigger('bank.account.withdrawn', account.to_json)
        withdrawn
      end

      private
      def self.emitter
        Clark::Support::Emitter.adapter
      end
    end
  end
end
