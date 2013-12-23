require "bundler/gem_tasks"

desc "Test rainbow"
task :test do
  exec "ruby -Ilib test/rainbow_test.rb"
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
