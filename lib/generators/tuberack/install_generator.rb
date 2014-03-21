module Tuberack
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Implement CodeClimate test reporter"
      def codeclimate_test_help
        prepend_file 'test/test_helper.rb' do
          <<-EOH
# Uncomment while using CodeClimate, don't forget set token
# require 'codeclimate-test-reporter'
# CodeClimate::TestReporter.start

          EOH
        end
      end


      desc "Install Cucumber BDD"
      def generate_cucumber
        generate 'cucumber:install'
      end

      desc "Install SimpleCov"
      def copy_simplecov
        template ".simplecov", ".simplecov"
      end

      desc "Implement SimpleCov into Cucumber"
      def simplecov_cucumber
        prepend_file 'features/support/env.rb' do 
          <<-EOH
require 'simplecov'

          EOH
        end
      end

      desc "Implement SimpleCov into tests"
      def simplecov_test_help
        prepend_file 'test/test_helper.rb' do
          <<-EOH
require 'simplecov'

          EOH
        end
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