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
  gem 'rubocop', require: false
end

group :guard do
  gem 'guard'
  gem 'guard-rspec'
end

platform :rbx do
  gem 'json'
  gem 'rubysl'
end
