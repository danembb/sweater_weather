source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 5.2.6'

gem 'pg', '>= 0.18', '< 2.0'

gem 'puma', '~> 3.11'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap'
gem 'faraday'
gem 'jsonapi-serializer'
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'figaro'
  gem 'pry'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rubocop-rails'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'vcr'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'simplecov'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
