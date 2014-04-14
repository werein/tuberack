# Default and model tests
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

Minitest::Spec.register_spec_type(/Cell$/, Cell::TestCase) if defined? Cell
Minitest::Spec.register_spec_type(/Integration$|Feature$/, ActionDispatch::IntegrationTest)

# Integration tests
class ActionDispatch::IntegrationTest
  include RailsAdmin::Engine.routes.url_helpers if defined? RailsAdmin
end

# Switching to Warden test mode
if defined? Warden
  include Warden::Test::Helpers
  Warden.test_mode!
end