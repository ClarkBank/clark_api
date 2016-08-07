module Actors
  module Customer
    module UseCases
      def self.register_for_an_account(user_params)
        user = User.new(user_params)
        user.roles << Role.new(name: 'user')
        user.save!
        # emitter.trigger(:user_registered, user.to_hash.to_json)
        user
      end

      private
      def emitter
        @emitter ||= Clark::EventBus::Emitter
      end
    end
  end
end
