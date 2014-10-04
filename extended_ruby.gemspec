# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'extended_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "extended_ruby"
  spec.version       = ExtendedRuby::VERSION
  spec.authors       = ["Steven Li"]
  spec.email         = ["StevenJLi@gmail.com"]
  spec.summary       = %q{Extensions of Ruby classes}
  spec.description   = %q{Special functionality added to basic Ruby classes}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "3.0"
  spec.add_development_dependency "codeclimate-test-reporter", group: :test, require: nil
end
