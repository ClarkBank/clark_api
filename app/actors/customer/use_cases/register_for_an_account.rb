module Actors
  module Customer
    module UseCases
      def self.register_for_an_account(user_params)
        user = User.new(user_params)
        user.roles << Role.find_by(name: 'user')
        user.save!
        emitter.trigger(user.to_json, 'user.registered')
        user
      end

      private
      def self.emitter
        Clark::Support::Emitter.adapter
      end
    end
  end
end
