lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tuberack/version'

Gem::Specification.new do |spec|
  spec.name          = "tuberack"
  spec.version       = Tuberack::VERSION
  spec.authors       = ["JiriKolarik"]
  spec.email         = ["jiri.kolarik@imin.cz"]
  spec.description   = %q{Test your application better}
  spec.summary       = %q{Test your application with MiniTest::Spec, Cucumber, SimpleCover coverage and more}
  spec.homepage      = "http://werein.cz"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*", "License.txt", "Rakefile", "Readme.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '~> 4.0'
  spec.add_dependency 'sqlite3'
  spec.add_dependency 'minitest'
  spec.add_dependency 'capybara'
  spec.add_dependency 'mocha'
  spec.add_dependency 'shoulda'
  spec.add_dependency 'factory_girl_rails'
  spec.add_dependency 'simplecov'
  spec.add_dependency 'cucumber-rails'
  spec.add_dependency 'database_cleaner'
  spec.add_dependency 'letter_opener'
  spec.add_dependency 'codeclimate-test-reporter'
  spec.add_dependency 'coveralls'
  spec.add_dependency 'webmock'

  spec.add_development_dependency 'bundler', '~> 1.5'
end