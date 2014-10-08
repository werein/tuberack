TUBERACK = [ :minitest, :mocha, :simplecov, :codeclimate, :coveralls ]

# Keep it on top, don't change positions
require 'tuberack/codeclimate'
require 'tuberack/simplecov'
require 'tuberack/coveralls'

# Don't forget set token
CodeClimate::TestReporter.start if TUBERACK.include?(:codeclimate)

Coveralls.wear! if Coveralls.should_run? if TUBERACK.include?(:coveralls)
# Coveralls.wear!('rails') # For RailsApp

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rails/test_help'
require 'tuberack/test_help'
require 'tuberack/test_help'
require 'tuberack/test_help'
require 'tuberack/test_help'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Capybara must be required directly 
if TUBERACK.include?(:capybara)
  begin
    require 'capybara/rails'
  rescue LoadError
    puts "You must put `gem 'capybara'` into your Gemfile and `bundle install` to use Capybara"
  end

  class ActionDispatch::IntegrationTest
    include Capybara::DSL
  end
end

include Tuberack::Helpers

WebMock.disable_net_connect! allow: %w(coveralls.io) if TUBERACK.include?(:webmock)

class ActiveSupport::TestCase
  # Uncomment if are you using Rails engine
  # include MyEngine::Engine.routes.url_helpers
end
