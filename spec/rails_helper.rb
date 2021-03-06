ENV['RAILS_ENV'] ||= 'test'
ENV['RABBIT_TOPIC'] = 'events'
ENV['RABBIT_VHOST'] = 'events'
ENV['RABBIT_HOST'] = 'localhost'

require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'support/request_helper'
require 'clark/event_bus'

ActiveRecord::Migration.maintain_test_schema!

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :transaction

RSpec.configure do |config|
  config.include Request::JsonHelper
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end
