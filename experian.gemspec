# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'experian/version'

Gem::Specification.new do |gem|
  gem.name          = "experian"
  gem.version       = Experian::VERSION
  gem.authors       = ["Wiehann Radyn"]
  gem.email         = ["wradyn@gmail.com"]
  gem.description   = %q{The experian gem interacts with the experian Credit Report provider web service using Ruby}
  gem.summary       = %q{Ruby wrapper for experian web service}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'fakeweb'

  gem.add_runtime_dependency 'savon', '1.2.0'
  gem.add_runtime_dependency 'ruby-mcrypt'
end
