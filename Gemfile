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
  gem 'rubocop', '0.81.0', require: false # This version supports Ruby 2.3
end

group :guard do
  gem 'guard'
  gem 'guard-rspec'
end

platform :rbx do
  gem 'json'
  gem 'rubysl'
end
