require 'clark/event_bus'

module Clark
  module Support
    module Emitter
      def self.adapter
        @emitter ||= Clark::EventBus::Emitter.new(options)
      end

      private
      def self.options
        {
          topic: ENV['RABBIT_TOPIC'],
          options: {
            vhost: ENV['RABBIT_VHOST'],
            host: ENV['RABBIT_HOST'],
            heartbeat: 1,
            continuation_timeout: 60000
          }
        }
      end
    end
  end
end
