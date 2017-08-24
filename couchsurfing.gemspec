# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "couchsurfing/version"

Gem::Specification.new do |spec|
  spec.name          = 'couchsurfing'
  spec.version       = Couchsurfing::VERSION
  spec.authors       = ["NickisKnowledge"]
  spec.email         = ["lifechangingstuff@gmail.com"]

  spec.summary       = 'This is a Flatiron CLI Data Gem Project.'
  spec.description   = 'This gem connects travelers to hosts across the country that have available housing accommodations.'
  spec.homepage      = ''
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  # spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
  spec.add_development_dependency "pry-byebug", "~> 3.4", ">= 3.4.2"

  spec.add_dependency "nokogiri"
end
