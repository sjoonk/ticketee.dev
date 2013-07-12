source 'http://rubygems.org'

gem 'rails', '3.1.12'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'dynamic_form'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test, :development do
  gem 'minitest-spec-rails'
  gem 'capybara'
  gem 'capybara_minitest_spec' # for capybara integration and spec matchers
  gem 'factory_girl_rails'
  gem "spork-minitest", "~> 1.0.0.beta1"
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'turn' # for prettier test output
  gem 'database_cleaner'
end

group :development do
  gem 'thin', :require => false
  # gem 'pry-rails'
  gem 'terminal-notifier-guard'
  gem 'guard-minitest'
  gem 'guard-spork'
  gem 'guard-livereload'
  gem 'guard-pow'
  # gem 'guard-cucumber'
end

