if TUBERACK.include?(:simplecov)
  begin
    require 'simplecov'
  rescue LoadError
    puts "You must put `gem 'simplecov'` into your Gemfile and `bundle install` to use Codeclimate service"
  end
end