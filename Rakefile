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
