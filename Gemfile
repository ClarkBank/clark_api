source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0'
gem 'puma', '~> 3.0'
gem 'jwt'
gem 'rack-cors'
gem 'pg'
gem 'sidekiq', '~> 4.1'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_girl_rails'
end

group :test do
  gem 'rspec'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
