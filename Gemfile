source 'https://rubygems.org'

# Specify your gem's dependencies in rainbow.gemspec
gemspec

gem 'coveralls', require: false
gem 'rake'
gem 'rspec'

group :development do
  gem 'mutant-rspec'
end

group :guard do
  gem 'guard'
  gem 'guard-rspec'
end

platform :rbx do
  gem 'json'
  gem 'rubysl'
end
