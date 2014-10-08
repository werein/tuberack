# Load generator TestCase
require 'rails/generators/test_case'

# MiniTest for Rails
if TUBERACK.include?(:minitest)
  begin
    require 'minitest/rails'
    require 'minitest/pride'
  rescue LoadError
    puts "You must put `gem 'minitest-rails'` into your Gemfile and `bundle install` to use MiniTest"
  end
end

# Shoulda matchers
if TUBERACK.include?(:shoulda)
  begin
    require 'shoulda'
  rescue LoadError
    puts "You must put `gem 'shoulda'` into your Gemfile and `bundle install` to use Shoulda"
  end
end

# Stubbing and mocking
if TUBERACK.include?(:mocha)
  begin
    require 'mocha/setup'
  rescue LoadError
    puts "You must put `gem 'mocha'` into your Gemfile and `bundle install` to use Mocha"
  end
end

# Test Cells
if TUBERACK.include?(:cell)
  begin
    require 'cell/test_case'
  rescue LoadError
    puts "You must put `gem 'cell'` into your Gemfile and `bundle install` to use Cells"
  end
end

# Replace fixtures with FactoryGirl
if TUBERACK.include?(:factory_girl)
  begin
    require 'factory_girl_rails'
  rescue LoadError
    puts "You must put `gem 'factory_girl_rails'` into your Gemfile and `bundle install` to use FactoryGirl"
  end
end

# Open Letter in browser
if TUBERACK.include?(:letter_opener)
  begin
    require 'letter_opener'
  rescue LoadError
    puts "You must put `gem 'letter_opener'` into your Gemfile and `bundle install` to use LetterOpenner"
  end
end

# Clean database
if TUBERACK.include?(:database_cleaner)
  begin
    require 'database_cleaner'
  rescue LoadError
    puts "You must put `gem 'database_cleaner'` into your Gemfile and `bundle install` to use DatabaseCleaner"
  end
end

# Stub Web requests
if TUBERACK.include?(:webmock)
  begin
    require 'webmock/minitest'
  rescue LoadError
    puts "You must put `gem 'webmock'` into your Gemfile and `bundle install` to use Webmock"
  end
end
