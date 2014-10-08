module Tuberack
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Implement Coveralls test reporter"
      def coveralls_test_help
        prepend_file 'test/test_helper.rb' do
          <<-EOH

Coveralls.wear! if Coveralls.should_run? if TUBERACK.include?(:coveralls)
# Coveralls.wear!('rails') # For RailsApp

          EOH
        end
      end

      desc "Implement Code Climate test reporter"
      def codeclimate_test_help
        prepend_file 'test/test_helper.rb' do
          <<-EOH

# Don't forget set token
CodeClimate::TestReporter.start if TUBERACK.include?(:codeclimate)
          EOH
        end
      end

      desc "Coverage tools"
      def coverage_requirements
        prepend_file 'test/test_helper.rb' do
          <<-EOH
# Keep it on top, don't change positions
require 'tuberack/codeclimate'
require 'tuberack/simplecov'
require 'tuberack/coveralls'
          EOH
        end
      end

      desc "Enabled services"
      def enabled_services
        prepend_file 'test/test_helper.rb' do
          <<-EOH
TUBERACK = [ :minitest, :shoulda, :mocha, :cell, :factory_girl, :webmock, :capybara, :simplecov, :codeclimate, :coveralls ]

          EOH
        end
      end

      desc "Install SimpleCov"
      def copy_simplecov
        template ".simplecov", ".simplecov"
      end


      desc "Implement Capybara into tests"
      def capybara_test_help
        append_file 'test/test_helper.rb' do
          <<-EOH
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
          EOH
        end
      end

      desc "Implement testable into tests"
      def tuberack_test_help
        file = File.read('test/test_helper.rb').sub(/require ("|')rails\/test_help("|')\n/, "require 'rails\/test_help'\nrequire 'tuberack/test_help'\n")
        File.write('test/test_helper.rb', file)

        append_file 'test/test_helper.rb' do
          <<-EOH
include Tuberack::Helpers
          EOH
        end
        
        append_file 'test/test_helper.rb' do
          <<-EOH

class ActiveSupport::TestCase
  # Uncomment if are you using Rails engine
  # include MyEngine::Engine.routes.url_helpers
end
          EOH
        end
      end

      desc "Stube web request"
      def webmock_test_help        
        append_file 'test/test_helper.rb' do
          <<-EOH
WebMock.disable_net_connect! allow: %w(coveralls.io) if TUBERACK.include?(:webmock)
          EOH
        end
      end
    end
  end
end