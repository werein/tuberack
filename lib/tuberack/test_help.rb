require 'tuberack/dummy_controller'
require 'tuberack/dummy_user'

if ENV['RAILS_ENV'] == 'test'
  require 'tuberack/requirements'
  require 'tuberack/helpers'
end

# Default and model tests
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods if TUBERACK.include?(:factory_girl)
end

if TUBERACK.include?(:minitest)
  Minitest::Spec.register_spec_type(/Cell$/, Cell::TestCase) if TUBERACK.include?(:cell)
  Minitest::Spec.register_spec_type(/Feature$/, ActionDispatch::IntegrationTest)
end

# Integration tests
class ActionDispatch::IntegrationTest
  include RailsAdmin::Engine.routes.url_helpers if defined? RailsAdmin
end

# Switching to Warden test mode
if defined? Warden
  include Warden::Test::Helpers
  Warden.test_mode!
end