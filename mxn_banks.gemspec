# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mxn_banks/version'

Gem::Specification.new do |spec|
  spec.name          = 'mxn_banks'
  spec.version       = MxnBanks::VERSION
  spec.authors       = ['aldosolorzano']
  spec.email         = ['aldosolorzanop@gmail.com']

  spec.summary       = 'Get mexican banks from IBAN'
  spec.homepage      = 'https://github.com/coincovemx/mxn-banks'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'pry', '~> 0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0'
end
