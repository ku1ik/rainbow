begin
  require "bundler/gem_tasks"
rescue LoadError
  # No bundler, does not install gem_tasks
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  # No RSpec, does not install rake_task
  # Add blank replacement task
  task :spec do
    # No-op
  end
end

task default: :spec
