if ENV['RAILS_ENV'] == 'test'
  require 'tuberack/requirements'
  require 'tuberack/helpers'
  require 'tuberack/test_help'
end

require 'tuberack/dummy_controller'
require 'tuberack/dummy_user'

module Tuberack
end