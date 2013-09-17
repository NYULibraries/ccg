# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ccg/version'

Gem::Specification.new do |spec|
  spec.name          = "ccg"
  spec.version       = Ccg::VERSION
  spec.authors       = ["Joseph Pawletko"]
  spec.email         = ["jgp@nyu.edu"]
  spec.description   = %q{Content Creation Group (ccg) Tools}
  spec.summary       = %q{Command line tools for CCG, focus on DLTS Digital Object Types}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "thor"
end
