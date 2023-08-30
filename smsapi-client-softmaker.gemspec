# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'smsapi/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'smsapi-client-softmaker'
  spec.version       = Smsapi::VERSION
  spec.authors       = ['Alek Niemczyk', 'Michal Musialik', 'Anna Ślimak', 'Kamil Suchanek']
  spec.email         = ['kamilsuchanek95@gmail.com']

  spec.summary       = 'SMSAPI.pl Ruby client'
  spec.description   = 'SMSAPI.pl Ruby client created by Ruby Logic S.C. and changed by Softmaker.io'
  spec.homepage      = 'https://github.com/softmaker-io/smsapi-client-softmaker'
  spec.licenses       = ['MIT']

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- spec/*`.split("\n")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
