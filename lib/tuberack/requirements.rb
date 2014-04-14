# MiniTest for Rails
require 'minitest-spec-rails'
require 'minitest/pride'

# Shoulda matchers
require 'shoulda'

# Stubbing and mocking
require 'mocha/setup'

# Test Cells
require 'cell/test_case' if defined? Cell

# Replace fixtures with FactoryGirl
require 'factory_girl_rails'

# Open Letter in browser
require 'letter_opener'

# Clean database
require 'database_cleaner'

# Stub Web requests
require 'webmock/minitest'