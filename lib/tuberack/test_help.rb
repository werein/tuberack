# Default and model tests
class ActiveSupport::TestCase
  extend MiniTest::Spec::DSL

  include FactoryGirl::Syntax::Methods

  class << self
    remove_method :describe
  end

  register_spec_type self do |desc|
    desc < ActiveRecord::Base if desc.is_a? Class
  end
end

# View tests
class ActionView::TestCase
  register_spec_type(/Helper/, self)
end

# Controller tests
class ActionController::TestCase
  register_spec_type(/Controller$/, self)
end

# Cell tests
class Cell::TestCase
  register_spec_type(/Cell$/, self)
end if defined? Cell

# Integration tests
class ActionDispatch::IntegrationTest
  include RailsAdmin::Engine.routes.url_helpers if defined? RailsAdmin
  register_spec_type(/Feature$/, self)
end

# Switching to Warden test mode
if defined? Warden
  include Warden::Test::Helpers
  Warden.test_mode!
end