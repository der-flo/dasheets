# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dasheets/version'

Gem::Specification.new do |spec|
  spec.name          = 'dasheets'
  spec.version       = Dasheets::VERSION
  spec.authors       = ['Florian Dütsch']
  spec.email         = ['florian.duetsch@nix-wie-weg.de']
  spec.description   = 'Generate cheatsheets for Dash'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/Nix-wie-weg/dasheets'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'thor'
  spec.add_dependency 'haml', '~> 4.0.3'
  spec.add_dependency 'sqlite3', '~> 1.3.8'
  spec.add_dependency 'plist', '~> 3.1.0'
end
