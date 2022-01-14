# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rainbow/version'

Gem::Specification.new do |spec|
  spec.name                  = "rainbow"
  spec.version               = Rainbow::VERSION
  spec.authors               = ["Marcin Kulik", "Olle Jonsson"]
  spec.email                 = ["m@ku1ik.com"]
  spec.description           = 'Colorize printed text on ANSI terminals'
  spec.summary               = 'Colorize printed text on ANSI terminals'
  spec.homepage              = "https://github.com/sickill/rainbow"
  spec.license               = "MIT"
  spec.required_ruby_version = '>= 2.4.0'

  spec.files = Dir['lib/**/*', 'Changelog.md', 'README.markdown', 'LICENSE']
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", [">= 1.3", "< 3"]
end
