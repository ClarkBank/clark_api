require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"

Bundler.require(*Rails.groups)

module ClarkApi
  class Application < Rails::Application
    config.api_only = true
    config.autoload_paths << Rails.root.join('lib')
    config.middleware.delete ::Rack::ETag
    config.middleware.delete ::Rack::Sendfile
    config.middleware.delete ::Rack::ConditionalGet
    config.middleware.delete ::ActionDispatch::Static
    config.middleware.delete ::ActionDispatch::Reloader
    config.middleware.delete ::ActionDispatch::Cookies
    config.middleware.delete ::ActionDispatch::Session::CacheStore
    config.middleware.delete ::ActionDispatch::Session::CookieStore
  end
end

require_relative '../app/actors/customer/customer'
