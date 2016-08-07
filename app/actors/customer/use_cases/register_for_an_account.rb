module Actors
  module Customer
    module UseCases
      def self.register_for_an_account(user_params)
        user = User.new(user_params)
        user.roles << Role.new(name: 'user')
        user.save!
        user
      end
    end
  end
end
