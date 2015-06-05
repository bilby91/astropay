# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'astropay/version'

Gem::Specification.new do |spec|
  spec.name          = "astropay"
  spec.version       = Astropay::VERSION
  spec.authors       = ["Martin Fernandez"]
  spec.email         = ["fmartin91@gmail.com"]

  spec.summary       = %q{ Astropay API client. }
  spec.homepage      = "https://www.github.com/bilby91/astropay"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"
  spec.add_dependency "hasugar"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end