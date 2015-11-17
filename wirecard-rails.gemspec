# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wirecard/rails/version"

Gem::Specification.new do |spec|
  spec.name          = "wirecard-rails"
  spec.version       = Wirecard::Rails.version
  spec.authors       = ["Dominic Breuker", "Michael Rüffer"]
  spec.email         = ["dominic.breuker@hitfoxgroup.com", "mr@hitfoxgroup.com"]

  spec.summary       = "Wirecard gem support for Rails"
  spec.description   = "This engine integrates the wirecard payment service with your rails application."
  spec.homepage      = "http://www.hitfoxgroup.com"
  spec.licenses       = ["MIT"]

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rails", "~> 4.2"
  
  spec.add_runtime_dependency "wirecard"
  spec.add_runtime_dependency "state_machines-activerecord", "~> 0.3"
end
