module Actors
  module Account
    module UseCases
      def self.open_bank_account(account_params)
        puts "Creating a bank account with #{account_params.to_h}"
        account = ::Account.new(account_params)
        opened = account.save!
        emitter.trigger(account.to_json, 'bank.account.opened')
        opened
      end

      private
      def self.emitter
       Clark::Support::Emitter.adapter
      end
    end
  end
end
