if TUBERACK.include?(:codeclimate)
  begin
    require 'codeclimate-test-reporter'
  rescue LoadError
    puts "You must put `gem 'codeclimate-test-reporter'` into your Gemfile and `bundle install` to use Codeclimate service"
  end
end