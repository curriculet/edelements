# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edelements/version'

Gem::Specification.new do |spec|
  spec.name          = "edelements"
  spec.version       = Edelements::VERSION

  spec.authors       = ["Vitalya Shevtsov"]
  spec.email         = ["kaktusyaka@gmail.com"]
  spec.date          = "2014-04-28"
  spec.description   = "Edelements wrap the Edelements API nicely"
  spec.summary       = "Edelements wrap the Edelements API nicely"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
