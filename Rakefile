require 'rubygems'
require 'rake'
require 'rake/gempackagetask'

task :default => [:repackage]

spec = eval(File.read('rainbow.gemspec'))
Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 

desc "Test rainbow"
task :test do
  exec "ruby test/rainbow_test.rb"
end

def ruby_files_for_shell
  files = Dir.glob 'lib/**/*.rb'
  files.join(' ')
end

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  args = ruby_files_for_shell
  exec "reek --quiet #{args}"
end

desc 'Check for duplicate code'
task :flay do
  puts 'Check for duplicate code...'
  args = ruby_files_for_shell
  exec "flay #{args}"
end
