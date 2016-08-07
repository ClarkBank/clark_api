module Actors
  module Account
    module UseCases
      def self.open_bank_account(account_params)
        puts "Creating a bank account with #{account_params}"
        account = ::Account.new(account_params)
        opened = account.save!
        # emitter.trigger(bank.account.opened, account.to_hash.to_json)
        opened
      end

      private
      def emitter
        @emitter ||= Clark::EventBus::Emitter
      end
    end
  end
end
