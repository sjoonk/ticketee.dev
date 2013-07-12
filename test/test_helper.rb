ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/rails'

Turn.config do |c|
  c.format = :outline
  c.trace = 1
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Transactional fixtures do not work with Selenium tests, because Capybara
# uses a separate server thread, which the transactions would be hidden
# from. We hence use DatabaseCleaner to truncate our test database.
DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # Stop ActiveRecord from wrapping tests in transactions
  self.use_transactional_fixtures = false

  teardown do
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
end

# Aliasing DSL more looking like cucumber/rspec style

class MiniTest::Spec
  class << self
    alias_method :context, :describe
  end
end

class ActionDispatch::IntegrationTest
  class << self
    alias_method :feature, :describe
    alias_method :scenario, :it
  end
end
