# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'rake'

group :test do
  gem 'coveralls', require: false
  gem 'rspec'
end

group :development do
  gem 'mutant-rspec'
end

group :test, :development do
  gem 'base64'
  gem 'fiddle' unless RUBY_VERSION.start_with?('2.5')
  gem 'rubocop', '1.7.0', require: false # This version supports Ruby 2.4
end

group :guard do
  gem 'guard'
  gem 'guard-rspec'
end
