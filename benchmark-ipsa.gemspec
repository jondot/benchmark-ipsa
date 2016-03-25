# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'benchmark/ipsa/version'

Gem::Specification.new do |spec|
  spec.name          = "benchmark-ipsa"
  spec.version       = Benchmark::Ipsa::VERSION
  spec.authors       = ["Dotan Nahum"]
  spec.email         = ["jondotan@gmail.com"]

  spec.summary       = %q{Benchmark IPS with allocations}
  spec.description   = %q{Benchmark IPS with allocations}
  spec.homepage      = "https://github.com/jondot/benchmark-ips"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'benchmark-ips', '~> 2.5.0'
  spec.add_dependency 'memory_profiler', '~> 0.9.6'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
