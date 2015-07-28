# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wirecard/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'wirecard-rails'
  spec.version       = Wirecard::Rails::VERSION
  spec.authors       = ['Admam Bahlke, Dominic Breuker, Michael Rüffer']
  spec.email         = ['mr@hitfoxgroup.com']

  spec.summary       = %q{Wirecard gem support for Rails}
  spec.description   = %q{This engine integrates the wirecard payment service with your rails application.}
  spec.homepage      = 'www.hitfoxgroup.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rails', '~> 4.2'
  spec.add_development_dependency 'wirecard', '~> 0.1'
end
