# TubeRack

Test your application better

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'testable', group: [:development, :test], require: false
```

into your my_gem.gemspec, when building gem:
```ruby
s.add_development_dependency 'tuberack'
```

Or install it yourself as:

    gem install tuberack

After that install TubeRack into your application

	rails g tuberack:install

## Usage

1. Uncomment and change engine name in `test/test_help.rb` if are you building gem
2. Change name of your app in `.simplecov` or remove everything inside block

Now you are able to test your application with

* MiniTest Spec
* Cucumber
* SimpleCov
* Shoulda
* Mocha
* FactoryGirl
* LetterOpener
* Cell tests

# Set app user

You can easily set current user with user ability with cell. Just load it in your view and point current user instance

```ruby
= render_cell 'tuberack/switcher', :show, current_user
```