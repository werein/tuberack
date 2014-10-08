lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tuberack/version'

Gem::Specification.new do |spec|
  spec.name          = "tuberack"
  spec.version       = Tuberack::VERSION
  spec.authors       = ["Jiri Kolarik"]
  spec.email         = ["jiri.kolarik@wereinhq.com"]
  spec.description   = %q{Tuberack for testing services}
  spec.summary       = %q{Handle your testing libraries easier}
  spec.homepage      = "http://wereinhq.com"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*", "License.txt", "Rakefile", "Readme.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '~> 4.0'
  spec.add_dependency 'sqlite3'

  spec.add_development_dependency 'minitest-rails'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'codeclimate-test-reporter'
end