# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datastructures/version'

Gem::Specification.new do |gem|
  gem.name          = "datastructures"
  gem.version       = Datastructures::VERSION
  gem.authors       = ["Ezekiel Smithburg"]
  gem.email         = ["tehgeekmeister@gmail.com"]
  gem.description   = %q{Fundamental datastructures that might be suitable for reuse.}
  gem.summary       = %q{BEWARE: I'm building these for fun right now.  As a result, they might actually be impractically slow,
                         even though I'm doing my best to ensure that the overall complexity is right.}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
