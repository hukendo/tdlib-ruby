# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tdlib/version'

Gem::Specification.new do |gem|
  gem.name          = "tdlib-ruby"
  gem.version       = TD::VERSION
  gem.summary       = 'Ruby bindings and client for TDlib'
  gem.description   = 'Ruby bindings and client for TDlib'
  gem.license       = "MIT"
  gem.authors       = ["Southbridge"]
  gem.email         = "ask@southbridge.io"
  gem.homepage      = "https://github.com/centosadmin/tdlib-ruby"

  gem.files         = `git ls-files`.split($/)

  `git submodule --quiet foreach --recursive pwd`.split($/).each do |submodule|
    submodule.sub!("#{Dir.pwd}/",'')

    Dir.chdir(submodule) do
      `git ls-files`.split($/).map do |subpath|
        gem.files << File.join(submodule,subpath)
      end
    end
  end
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'dry-configurable', '~> 0.7'
  gem.add_runtime_dependency 'concurrent-ruby', '~> 1.0'

  gem.add_development_dependency 'bundler', '~> 2.0'
  gem.add_development_dependency 'rake', '13.0.1'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.9'
  gem.add_development_dependency 'pry', '~> 0.11'
end
