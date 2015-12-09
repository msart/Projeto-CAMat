source 'https://rubygems.org'

gem 'rails', '3.2.16'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'delayed_job_active_record'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml-rails', '>= 0.3.4'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test do
  # Easier test writing
  gem 'test-unit'
  gem "shoulda-matchers", "~> 2.8.0"
  gem 'capybara'
  gem 'guard-rspec'
  gem 'faker'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'simplecov'
end
group :development, :test do
# Test framework
  gem 'rspec-rails', '~> 3.3.2'

  # Mock framework
  gem 'mocha', '~> 1.1.0'

  # Fixtures made easy
  gem 'factory_girl_rails', '~> 4.5.0'
  
  gem 'magic_encoding', '~> 0.0.2'
end

group :cucumber do
  gem 'cucumber', '~> 1.3.18'
  gem 'cucumber-rails'
  # Version fixed greater than 1.4.1. See:
  # https://github.com/DatabaseCleaner/database_cleaner/issues/317
  gem 'database_cleaner', '>= 1.4.1'
  gem 'poltergeist', '~> 1.6.0'
end

gem 'jquery-rails'

#To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'devise', '~> 3.5.2'

# For easy Ajax
# More info in http://rails-ajax.x-aeon.com/
gem 'rails-ajax'