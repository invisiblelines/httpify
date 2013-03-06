# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'httpify'

Gem::Specification.new do |gem|
  gem.name          = "httpify"
  gem.version       = Httpify::VERSION
  gem.authors       = ["Kieran Johnson"]
  gem.email         = ["kieran@invisiblelines.com"]
  gem.homepage      = "http://github.com/invisiblelines/httpify"
  gem.summary       = "Prefixes any httpified elements with http://"
  gem.description   = "Prefixes any httpified elements with http:// should they be missing this"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "active_support", ">= 3.0"

  gem.add_development_dependency "rspec"
end