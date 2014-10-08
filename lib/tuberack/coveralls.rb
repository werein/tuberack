if TUBERACK.include?(:coveralls)
  begin
    require 'coveralls'
  rescue LoadError
    puts "You must put `gem 'coveralls'` into your Gemfile and `bundle install` to use Coveralls service"
  end
end