# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "collegiate_directories/version"

Gem::Specification.new do |spec|
  spec.name          = "collegiate_directories"
  spec.version       = CollegiateDirectories::VERSION
  spec.authors       = ["Paul Stengel"]
  spec.email         = ["paul.stengel@lockerroomtalk.com"]
  spec.license       = "MIT"

  # rubocop:disable Metrics/LineLength
  spec.summary       = "Gem for interacting with the https://www.collegiatedirectories.com API"
  spec.homepage      = "https://github.com/lockerroomtalk/collegiate_directories"
  # rubocop:enable Metrics/LineLength

  spec.files         = `git ls-files -z`.split("\x0")
  spec.files.reject! { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.14"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "dotenv",        "~> 2.1"
  spec.add_development_dependency "rake",          "~> 10.0"
  spec.add_development_dependency "rspec",         "~> 3.5"
  spec.add_development_dependency "rubocop",       "~> 0.43"
  spec.add_development_dependency "rubocop-rspec", "~> 1.4"
end
