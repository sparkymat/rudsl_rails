# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rudsl_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "rudsl_rails"
  spec.version       = RudslRails::VERSION
  spec.authors       = ["Ajith Hussain"]
  spec.email         = ["csy0013@googlemail.com"]
  spec.summary       = %q{rudsl_rails provides a nice way of using rudsl inside Rails}
  spec.description   = %q{rudsl_rails helps organise your Rails views written in rudsl, through cards.}
  spec.homepage      = "https://www.github.com/sparkymat/rudsl_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "rails", ">= 4.0"
  spec.add_runtime_dependency "rudsl", ">= 1.0"
end
