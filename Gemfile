source 'https://rubygems.org'

# Specify your gem's dependencies in rainbow.gemspec
gemspec

gem 'rake'
gem 'coveralls', require: false
gem 'mime-types', '< 2.0.0', platforms: [:ruby_18]
gem 'rspec', '3.0.0beta2'

gem 'windows-pr' if RUBY_PLATFORM =~ /win32/i || RUBY_PLATFORM =~ /mingw32/i
gem 'win32console' if RUBY_PLATFORM =~ /win32/i || RUBY_PLATFORM =~ /mingw32/i

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
