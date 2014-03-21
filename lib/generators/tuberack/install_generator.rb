module Tuberack
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Implement Coveralls test reporter"
      def coveralls_test_help
        prepend_file 'test/test_helper.rb' do
          <<-EOH

Coveralls.wear!
# Coveralls.wear!('rails') # For RailsApp

          EOH
        end
      end

      desc "Implement Code Climate test reporter"
      def codeclimate_test_help
        prepend_file 'test/test_helper.rb' do
          <<-EOH

# Don't forget set token
CodeClimate::TestReporter.start
          EOH
        end
      end

      desc "Coverage tools"
      def coverage_requirements
        prepend_file 'test/test_helper.rb' do
          <<-EOH
# Keep it on top, don't change positions
require 'simplecov'
require 'coveralls'
require 'codeclimate-test-reporter'
          EOH
        end
      end

      desc "Install Cucumber BDD"
      def generate_cucumber
        generate 'cucumber:install'
      end

      desc "Implement SimpleCov into Cucumber"
      def simplecov_cucumber
        prepend_file 'features/support/env.rb' do 
          <<-EOH
require 'simplecov'

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

require 'capybara/rails' # Capybara must be required directly          

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
          EOH
        end
      end

      desc "Implement testable into tests"
      def testable_test_help
        append_file 'test/test_helper.rb' do
          <<-EOH

require 'tuberack'

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
    end
  end
end